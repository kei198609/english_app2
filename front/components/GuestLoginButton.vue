<template>
  <v-btn
    text
    class="ml-2 font-weight-bold"
    color="black"
    @click="guestLogin"
  >
    ゲストログイン
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
