<template>
  <v-navigation-drawer
    v-model="setDrawer"
    app
    clipped
    :mobile-breakpoint="mobileBreakpoint"
    color="#fbfbfb"
  >
    <v-list>
      <!-- close-button -->
      <template
      v-if="isMobileBreakpointLessThan"
      >
        <v-list-item
          @click="$emit('update:drawer', false)"
        >
          <v-list-item-content>
            <v-list-item-action-text>
              <v-icon>
                mdi-chevron-double-left
              </v-icon>
              閉じる
            </v-list-item-action-text>
          </v-list-item-content>
        </v-list-item>
        <v-divider />
      </template>
      <!-- nav menus -->
      <v-list-item
        v-for="(nav, i) in navMenus"
        :key="`nav-${i}`"
        :to="$my.menuLinkTo($auth.user.id, nav.name)"
      >
        <v-list-item-icon>
          <v-icon color="appblack">{{ nav.icon }}</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>
            {{ $my.pageTitle(nav.name) }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>

    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  props: {
    drawer: {
      type: Boolean,
      default: null
    }
  },
  data () {
    return {
      mobileBreakpoint: 960,
      navMenus: [
        { name: 'tops', icon: 'mdi-home' },
        { name: 'top-id-users', icon: 'mdi-account-multiple' },
        { name: 'top-id-mypage', icon: 'mdi-account-circle' },
        { name: 'top-id-article', icon: 'mdi-book-open-page-variant' },
        { name: 'top-id-quiz', icon: 'mdi-book-open-page-variant' },
        { name: 'top-id-post', icon: 'mdi-pen-plus' },
        { name: 'top-id-bookmark', icon: 'mdi-bookmark' },
        { name: 'top-id-notifications', icon: 'mdi-bell' },
        { name: 'top-id-settings', icon: 'mdi-account-cog' }
      ]
    }
  },
  computed: {
    setDrawer: {
      get () { return this.drawer },
      set (newVal) { return this.$emit('update:drawer', newVal) }
    },
    isMobileBreakpointLessThan () {
      const windowWidth = this.$vuetify.breakpoint.width
      return this.mobileBreakpoint > windowWidth
    }
  }
}
</script>
