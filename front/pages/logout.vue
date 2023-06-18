<template>
  <div>ログアウトしています...</div>
</template>

<script>
export default {
  mounted () {
    this.logout()
  },
  methods: {
    async logout () {
      try {
        await this.$auth.logout()
        this.$router.push('/')
      } catch (err) {
        console.error(err)
      }
    }
  }
}
</script>
