<template>
  <v-app-bar
    color="white"
  >
    <app-logo
    />

    <v-toolbar-title class="hidden-mobile-and-down black--text">
      Mail Mentor
    </v-toolbar-title>

    <v-spacer />

    <template v-if="$vuetify.breakpoint.mdAndUp">
      <before-login-app-bar-signup-button />
      <before-login-app-bar-login-button />
      <GuestLoginButton />
    </template>
    <template v-else>
      <v-menu
        bottom
        right
        offset-x
      >
        <template v-slot:activator="{ on }">
          <v-app-bar-nav-icon v-on="on" />
        </template>
        <v-list>
          <v-list-item>
            <before-login-app-bar-signup-button />
          </v-list-item>
          <v-list-item>
            <before-login-app-bar-login-button />
          </v-list-item>
          <v-list-item>
            <GuestLoginButton />
          </v-list-item>
        </v-list>
      </v-menu>
    </template>
  </v-app-bar>
</template>

<script>
import GuestLoginButton from '~/components/GuestLoginButton.vue'
// import AppUserGuideButton from '~/components/AppUserGuideButton.vue'
export default {
  components: {
    GuestLoginButton
    // AppUserGuideButton
  }
}
</script>
