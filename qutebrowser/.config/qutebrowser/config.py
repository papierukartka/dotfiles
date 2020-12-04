config.load_autoconfig()

c.content.cookies.accept = 'no-3rdparty'
c.content.cookies.store = False

c.url.default_page = 'https://html.duckduckgo.com/'
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}"}
c.url.start_pages = 'https://html.duckduckgo.com'
