const CACHE_NAME = 'flutter-conf-v1';
const RUNTIME_CACHE = 'flutter-conf-runtime-v1';

const PRECACHE_ASSETS = [
    '/',
    '/index.html',
    '/manifest.json',
    '/favicon.ico',
    '/apple-touch-icon.png',
];

self.addEventListener('install', (event) => {
    console.log('[ServiceWorker] Installing...');

    event.waitUntil(
        caches.open(CACHE_NAME)
            .then((cache) => {
                console.log('[ServiceWorker] Precaching assets');
                return cache.addAll(PRECACHE_ASSETS);
            })
            .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', (event) => {
    console.log('[ServiceWorker] Activating...');

    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames.map((cacheName) => {
                    if (cacheName !== CACHE_NAME && cacheName !== RUNTIME_CACHE) {
                        console.log('[ServiceWorker] Deleting old cache:', cacheName);
                        return caches.delete(cacheName);
                    }
                })
            );
        }).then(() => self.clients.claim())
    );
});

self.addEventListener('fetch', (event) => {
    const {request} = event;
    const url = new URL(request.url);

    if (request.method !== 'GET') return;

    if (!url.protocol.startsWith('http')) return;

    if (url.hostname.includes('firebase') ||
        url.hostname.includes('googleapis') ||
        url.hostname.includes('gstatic')) {
        event.respondWith(fetch(request));
        return;
    }

    event.respondWith(
        caches.match(request).then((cachedResponse) => {
            if (cachedResponse) {
                fetch(request).then((response) => {
                    if (response && response.status === 200) {
                        caches.open(RUNTIME_CACHE).then((cache) => {
                            cache.put(request, response.clone());
                        });
                    }
                }).catch(() => {
                });

                return cachedResponse;
            }

            return fetch(request).then((response) => {
                if (!response || response.status !== 200 || response.type === 'error') {
                    return response;
                }

                const responseToCache = response.clone();
                const cacheToUse = isStaticAsset(url) ? CACHE_NAME : RUNTIME_CACHE;

                caches.open(cacheToUse).then((cache) => {
                    cache.put(request, responseToCache);
                });

                return response;
            }).catch(() => {
                if (request.destination === 'document') {
                    return caches.match('/');
                }
            });
        })
    );
});

function isStaticAsset(url) {
    const staticExtensions = [
        '.js', '.css', '.woff', '.woff2', '.ttf',
        '.png', '.jpg', '.jpeg', '.webp', '.svg',
        '.gif', '.ico', '.json', '.wasm', '.riv'
    ];

    const pathname = url.pathname.toLowerCase();
    return staticExtensions.some(ext => pathname.endsWith(ext));
}

self.addEventListener('message', (event) => {
    if (event.data && event.data.type === 'SKIP_WAITING') {
        self.skipWaiting();
    }

    if (event.data && event.data.type === 'CLEAR_CACHE') {
        event.waitUntil(
            caches.keys().then((cacheNames) => {
                return Promise.all(
                    cacheNames.map((cacheName) => caches.delete(cacheName))
                );
            })
        );
    }
});
