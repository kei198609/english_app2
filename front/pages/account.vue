<template>
  <v-container>
    <nuxt-child />
  </v-container>
</template>

<script>
export default {
  layout: 'logged-in',
  // /accountパスは使用しないので、validate()メソッドでアクセス不可にする
  validate ({ route }) {
    return route.name !== 'account'
  }
}
</script>
