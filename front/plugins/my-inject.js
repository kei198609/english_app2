class MyInject {
  constructor (ctx) {
    this.app = ctx.app
  }
  // i18nページタイトル変換メソッド
  // routeNameには'account-settings'がくるが、以下の設定で、
  // 'pages.account.settings'となる。

  pageTitle (routeName) {
    const jsonPath = `pages.${routeName.replace(/-/g, '.')}`
    const title = this.app.i18n.t(jsonPath)
    return title
  }

  dataFormat (dataStr) {
    const dateTimeFormat = new Intl.DateTimeFormat(
      'ja', { dateStyle: 'medium', timeStyle: 'short' }
    )
    return dateTimeFormat.format(new Date(dataStr))
  }

  // プロジェクトリンク
  projectLinkTo (id, name = 'project-id-dashboard') {
    return { name, params: { id } }
  }
}
// injectとは、オリジナルクラスを追加することができる
// 主にアプリ全体で使うメソッドを管理します
// export default (第一引数context, 第二引数inject)
// inject('呼び出し名', クラスのインスタンス(context))
export default ({ app }, inject) => {
  inject('my', new MyInject({ app }))
}
