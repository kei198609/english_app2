// vue xを扱うファイル,アプリ共通の値やメソッドを追加することでアプリ全体で共有できるようになる,共通の変数 vueでいうとdataのようなもの
export const state = () => ({
  styles: {
    homeAppBarHeight: 56
  }
})
// アプリ全体の算出プロパティ,vueでいうとcomputedのようなもの
export const getters = {}

// stateで用意した値を変更する場所
export const mutations = {}

// vueでいうとmethodsのほうなもの
export const actions = {}
