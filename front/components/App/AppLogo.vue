<template>
  <v-avatar
    size="34"
    class="my-app-log"
  >
    <span :class="iconTextColor">
      <v-icon :color="iconColor">
        mdi-email-variant
      </v-icon>
    </span>
  </v-avatar>
</template>

<script>
export default {
  props: {
    isScrollPoint: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    iconTextColor () {
      return this.isScrollPoint ? 'black--text' : 'black--text'
    },
    iconColor () {
      return this.isScrollPoint ? '#000' : '#000'
    }
  }
}
</script>

<style lang="scss" scoped>
.my-app-log {
  margin-right: 8px;
  cursor: pointer;
}
</style>
