<template>
  <v-app-bar
    app
    :height="homeAppBarHeight"
    color="appyellow"
  >
    <nuxt-link
      to="/"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>

    <v-toolbar-title class="hidden-mobile-and-down black--text">
      Mail Mentor
    </v-toolbar-title>

    <v-spacer />

    <before-login-app-bar-signup-button />
    <before-login-app-bar-login-button />
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
