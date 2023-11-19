<template>
  <v-btn
    text
    class="ml-2 font-weight-bold custom-button-guest"
    @click="guestLogin"
  >
    試してみる
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
.custom-button-guest {
  background-color: #ffbf00;
  color: black;
}
</style>
