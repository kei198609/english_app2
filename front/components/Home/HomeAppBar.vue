<template>
  <v-app-bar
    app
    dark
  >
    <app-logo />

    <v-toolbar-title>
      Biz mail English
    </v-toolbar-title>

    <v-spacer />

    <v-toolbar-items class="ml-2">
      <v-btn
        v-for="(menu, i) in menus"
        :key="`menu-btn-${i}`"
        text
      >
        {{ $t(`menus.${menu.title}`) }}
      </v-btn>
    </v-toolbar-items>

  </v-app-bar>
</template>

<script>
export default {
  props: {
    menus: {
      type: Array,
      default: () => []
    }
  }
}
</script>
