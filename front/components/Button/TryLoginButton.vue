<template>
  <v-btn
    text
    x-large
    class="ml-2 font-weight-bold custom-button-try"
    @click="guestLogin"
  >
    無料でお試し
  </v-btn>
</template>

<script>
export default {
  methods: {
    async guestLogin () {
      try {
        // Authモジュールの`loginWith`メソッドを使用してゲストログイン
        await this.$auth.loginWith('local', {
          data: {},
          url: '/api/v1/auth/sessions/guest_sign_in'
        })
      } catch (error) {
        console.error('ゲストログインに失敗しました', error)
      }
    }
  }
}
</script>
<style>
.custom-button-try {
  background-color: #ffbf00;
  width: 300px;
  border-radius: 0;
}
</style>
