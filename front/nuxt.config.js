export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'app',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    'plugins/axios',
    'plugins/my-inject'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    '@nuxtjs/vuetify',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    '@nuxtjs/i18n',
  ],

  auth: {
    redirect: {
      login: '/login', //middleware:authを設定したURLにアクセスがあった場合の、リダイレクト先。
      logout: '/', //ログアウト後のリダイレクト先
      callback: false,
      home: '/tops' ///ログイン後のリダイレクト先。
    },
    strategies: {
      local: {
        token: {
          property: 'access-token',
          type: 'Bearer'
        },
        endpoints: {
          //ログイン処理に関する設定
          login: { url: '/api/v1/auth/sign_in', method: 'post'},
          //ログアウト処理に関する設定
          logout: { url: '/api/v1/auth/sign_out', method: 'delete' },
          //ログイン時にユーザー情報を保存するか。
          user: {
            url: '/api/v1/auth/validate_token', // ユーザー情報を取得するAPIのエンドポイント
            method: 'get', // そのAPIへのリクエストメソッド
            propertyName: 'data' // レスポンスからユーザー情報を抽出するためのプロパティ名
          },
          guest: { url: '/api/v1/auth/sessions/guest_sign_in', method: 'post', propertyName: 'access-token' }
        },
      }
    },
  },

  // apiBaseUrlは使用予定ないので削除してもよい
  publicRuntimeConfig: {
    appName: process.env.APP_NAME,
    apiBaseUrl: process.env.API_BASE_URL || 'http://localhost:3000'
  },

  env: {
    apiBaseUrl: process.env.API_BASE_URL || 'http://localhost:3000'
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
    // baseURL: '/'
    baseURL: "http://localhost:3000"
  },

  vuetify: {
    // 開発環境でcustomVariablesを有効にするフラグ
    treeShake: true,
    // Doc: https://vuetifyjs.com/ja/customization/a-la-carte/
    // カスタムcssファイルパス
    customVariables: ['~/assets/sass/variables.scss'],
    theme: {
      themes: {
        light: {
          primary: '7097C3',
          info: '4FC1E9',
          success: '44D69E',
          warning: 'FEB65E',
          error: 'FB8678',
          background: 'f6f6f4',
          appblue: '1867C0'
        }
      }
    }
  },

  i18n: {
    locales: ['ja', 'en'],
    defaultLocale: 'ja',
    // ルート名に__jaを追加しない
    strategy: 'no_prefix',
    // Doc: https://kazupon.github.io/vue-i18n/api/#properties
    vueI18n: {
      fallbackLocale: 'ja',
      // silentTranslationWarn: true,
      silentFallbackWarn: true,
      messages: {
        ja: require('./locales/ja.json'),
        en: require('./locales/en.json')
      }
    }
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },

}
