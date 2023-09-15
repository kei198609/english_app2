const homePath = 'tops'
// vue xを扱うファイル,アプリ共通の値やメソッドを追加することで
// アプリ全体で共有できるようになる,共通の変数 vueでいうとdataのようなもの
export const state = () => ({
  styles: {
    homeAppBarHeight: 56
  },
  loggedIn: {
    homePath: {
      name: homePath
    }
  },
  quizAttempts: []
})
// アプリ全体の算出プロパティ,vueでいうとcomputedのようなもの
export const getters = {
  getQuizAttempt: state => (quizId) => {
    return state.quizAttempts.find(attempt => attempt.quiz_id === quizId)
  }
}

// stateで用意した値を変更する場所
export const mutations = {
  SET_QUIZ_ATTEMPTS (state, attempts) {
    state.quizAttempts = attempts
  },
  ADD_QUIZ_ATTEMPT (state, attempt) {
    state.quizAttempts.push(attempt)
  }
}

// vueでいうとmethodsのほうなもの
export const actions = {
  async fetchQuizAttempts ({ commit }) {
    try {
      const response = await this.$axios.get('/api/v1/quiz_attempts')
      commit('SET_QUIZ_ATTEMPTS', response.data)
    } catch (error) {
      console.error('Failed to fetch quiz attempts.', error)
    }
  }
}
