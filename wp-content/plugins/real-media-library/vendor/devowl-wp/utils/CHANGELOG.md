# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 1.9.2 (2021-01-24)


### fix

* make restNonce option optional for public APIs (CU-cwvke2)





## 1.9.1 (2021-01-11)


### build

* reduce javascript bundle size by using babel runtime correctly with webpack / babel-loader


### chore

* **release :** publish [ci skip]


### fix

* caching issues with new versions in settings page
* compatibility with combine JS in newest WP Rocket update (CU-c11w2c)
* generate dependency map for translations
* wrong language for duplicated cookie when using PolyLang default language in admin dashboard





# 1.9.0 (2020-12-15)


### feat

* introduce code splitting with chunked translations (CU-b10ahe)





## 1.8.1 (2020-12-10)


### chore

* export sprintf as i18n method





# 1.8.0 (2020-12-09)


### feat

* more customizable multipart requests (CU-80q24e)





# 1.7.0 (2020-12-09)


### chore

* update to webpack v5 (CU-4akvz6)
* updates typings and min. Node.js and Yarn version (CU-9rq9c7)
* **release :** publish [ci skip]


### feat

* allow uploading files via commonRequest (CU-80q24e)
* introduce code splitting functionality to plugins (CU-b10ahe)


### fix

* anonymous localized script settings to avoid incompatibility with WP Rocket lazy execution (CU-b4rp51)





## 1.6.3 (2020-12-01)


### chore

* update dependencies (CU-3cj43t)
* update to composer v2 (CU-4akvjg)
* update to core-js@3 (CU-3cj43t)
* **release :** publish [ci skip]


### refactor

* enforce explicit-member-accessibility (CU-a6w5bv)





## 1.6.2 (2020-11-24)


### fix

* modify max index length for MySQL 5.6 databases so all database tables get created (CU-agzcrp)
* use no-store caching for WP REST API calls to avoid issues with browsers and CloudFlare (CU-agzcrp)





## 1.6.1 (2020-11-12)


### fix

* allow DELETE and PUT verbs to get empty response





# 1.6.0 (2020-10-23)


### feat

* add function getExternalContainerUrl to get backend URLs for frontend
* route PATCH PaddleIncompleteOrder (#8ywfdu)


### fix

* correctly detect usage of _method parameter


### refactor

* use "import type" instead of "import"





# 1.5.0 (2020-10-16)


### chore

* rename folder name (#94xp4g)


### feat

* announcements (#8cxk67)





## 1.4.7 (2020-10-09)


### fix

* delete requests to REST API does no longer set Content-Type (#90vkd5)





## 1.4.6 (2020-10-08)


### chore

* **release :** version bump





## 1.4.5 (2020-09-29)


### build

* backend pot files and JSON generation conflict-resistent (#6utk9n)


### chore

* introduce development package (#6utk9n)
* move backend files to development package (#6utk9n)
* move grunt to common package (#6utk9n)
* move packages to development package
* move packages to development package (#6utk9n)
* move some files to development package (#6utk9n)
* prepare package grunt scripts (#6utk9n)
* update dependencies (#3cj43t)





## 1.4.4 (2020-09-22)


### fix

* do not use encodeURIComponent as it is supported by url-parse by default
* import settings (#82rk4n)
* truncate -lite and -pro from REST service (#82rgxu)





## 1.4.3 (2020-08-26)


### ci

* install container volume with unique name (#7gmuaa)


### perf

* remove transients and introduce expire options for better performance (#7cqdzj)


### test

* fix ExpireOptionTest::testSet





## 1.4.2 (2020-08-17)


### ci

* prefer dist in composer install





## 1.4.1 (2020-08-11)


### chore

* backends for monorepo introduced





# 1.4.0 (2020-07-30)


### feat

* introduce dashboard with assistant (#68k9ny)
* WordPress 5.5 compatibility (#6gqcm8)





# 1.3.0 (2020-07-02)


### chore

* allow to define allowed licenses in root package.json (#68jvq7)
* update dependencies (#3cj43t)


### feat

* use window.fetch with polyfill instead of jquery (#5whc2c)





# 1.2.0 (2020-06-17)


### feat

* email input (with privacy checkbox) (#5ymj7f), 'none' option (#5ymhx1), reason note required (#5ymhjt)





# 1.1.0 (2020-06-12)


### chore

* i18n update (#5ut991)


### ci

* use hot cache and node-gitlab-ci (#54r34g)


### feat

* add abstract post and category REST model (#5phrh4)





## 1.0.8 (2020-05-20)


### chore

* move plugin/rcb branch to develop


### fix

* add PATCH to available HTTP methods (#5cjaau)
* remove ~ due to G6 blacklist filtering (security plugins, #5cqdn0)





## 1.0.7 (2020-05-12)


### build

* cleanup temporary i18n files correctly


### fix

* correctly enqueue dependencies (#52jf92)
* improvement speed up in admin dashboard (#52gj39)
* install database tables after reactivate plugin (#52k7f1)
* use correct assets class





## 1.0.6 (2020-04-27)


### chore

* add hook_suffix to enqueue_scripts_and_styles function (#4ujzx0)
* **release :** publish [ci skip]


### fix

* cronjob URL not working with plain permalink setting (#4pmk26, #4ar47j)





## 1.0.5 (2020-04-16)


### build

* move test namespaces to composer autoload-dev (#4jnk84)
* optional clean:webpackDevBundles grunt task to remove dev bundles in build artifact (#4jjq0u)
* scope PHP vendor dependencies (#4jnk84)


### chore

* create real-ad package to introduce more UX after installing the plugin (#1aewyf)
* rename real-ad to real-utils (#4jpg5f)


### ci

* correctly build i18n frontend files (#4jjq0u)
* run package jobs also on devops changes


### docs

* broken links in developer documentation (#5yg1cf)


### style

* reformat php codebase (#4gg05b)


### test

* fix typo in test files





## 1.0.4 (2020-03-31)


### chore

* update dependencies (#3cj43t)
* **release :** publish [ci skip]
* **release :** publish [ci skip]
* **release :** publish [ci skip]
* **release :** publish [ci skip]


### ci

* use concurrency 1 in yarn disclaimer generation


### test

* configure jest setupFiles correctly with enzyme and clearMocks (#4akeab)
* generate test reports (#4cg6tp)





## 1.0.3 (2020-03-05)


### build

* chunk vendor libraries (#3wkvfe) and update antd@4 (#3wnntb)


### chore

* update dependencies (webpack, types)
* **release :** publish [ci skip]





## 1.0.2 (2020-02-26)


### build

* migrate real-thumbnail-generator to monorepo


### fix

* usage of React while using Divi in dev environment (WP_DEBUG, #3rfqjk)
* use own wp_set_script_translations to make it compatible with deferred scripts (#3mjh0e)





## 1.0.1 (2020-02-13)


### fix

* do not load script translations for libraries (#3mjh0e)
