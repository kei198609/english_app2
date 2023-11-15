<template>
  <v-toolbar-title class="black--text">
    {{ appName }}
  </v-toolbar-title>
</template>

<script>
export default {
  data ({ $config: { appName } }) {
    return {
      appName
    }
  }
}
</script>
<style>
.black-text {
  color: black;
}
</style>
