<template>
  <v-toolbar-title class="black--text">
    {{ appName }}
  </v-toolbar-title>
</template>

<script>
export default {
  data () {
    return {
      appName: 'Mail Mentor'
    }
  }
}
</script>
<style>
.black-text {
  color: black;
}
</style>
