<template>
  <v-toolbar-title class="white--text">
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
