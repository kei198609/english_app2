<template>
  <v-app-bar
    app
    :dark="!isScrollPoint"
    :height="homeAppBarHeight"
    :color="toolbarStyle.color"
    :elevation="toolbarStyle.elevation"
  >
    <!-- 引数に渡したIDまでスクロールしてくれる -->
    <app-logo
      @click.native="$vuetify.goTo('#scroll-top')"
      :is-scroll-point="isScrollPoint"
    />

    <v-toolbar-title class="hidden-mobile-and-down">
      Mail Mentor
    </v-toolbar-title>

    <v-spacer />

    <template v-if="$vuetify.breakpoint.mdAndUp">
      <!-- ... -->
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
  },
  props: {
    menus: {
      type: Array,
      default: () => []
    },
    imgHeight: {
      type: Number,
      default: 0
    }
  },

  data ({ $store }) {
    return {
      scrollY: 0,
      homeAppBarHeight: $store.state.styles.homeAppBarHeight
    }
  },

  computed: {
    // 500-56=444pxの場合、trueを返す,ツールバーの色を変更するための設定
    isScrollPoint () {
      return this.scrollY > (this.imgHeight - this.homeAppBarHeight)
    },
    toolbarStyle () {
      // trueならwhite,falseならtransparent(透明)
      const color = this.isScrollPoint ? 'white' : 'transparent'
      const elevation = this.isScrollPoint ? 4 : 0
      return { color, elevation }
    }
  },

  mounted () {
    window.addEventListener('scroll', this.onScroll)
  },
  beforeDestroy () {
    window.removeEventListener('scroll', this.onScroll)
  },
  methods: {
    onScroll () {
      this.scrollY = window.scrollY
    }
  }
}
</script>
