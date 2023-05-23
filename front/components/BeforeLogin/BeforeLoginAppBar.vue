<template>
  <v-app-bar
    app
    :height="homeAppBarHeight"
    color="white"
  >
    <nuxt-link
      to="/"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>

    <v-toolbar-title class="hidden-mobile-and-down">
      Biz mail English
    </v-toolbar-title>

    <v-spacer />

    <app-signup-button />
    <app-login-button />
  </v-app-bar>
</template>

<script>
export default {
  data ({ $store }) {
    return {
      homeAppBarHeight: $store.state.styles.homeAppBarHeight
    }
  }
}
</script>
