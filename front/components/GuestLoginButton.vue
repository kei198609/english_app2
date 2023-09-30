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
        const response = await this.$axios.post('/api/v1/auth/sessions/guest_sign_in')
        const { headers, data } = response
        const token = headers['access-token']
        const client = headers.client
        const uid = headers.uid
        // Set the token for future requests
        this.$auth.setToken('local', token)
        this.$axios.setToken(token, 'Bearer')

        this.$auth.setUser({
          ...data,
          uid,
          client
        })
        window.location.href = '/tops'
        // this.$router.push('/tops')
      } catch (error) {
        console.error('ゲストログインに失敗しました', error)
      }
    }
  }
}
</script>
