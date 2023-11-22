<template>
  <v-btn
    text
    x-large
    class="ml-2 font-weight-bold custom-button-signup white--text"
    color="black"
    to="/signup"
  >
    {{ $my.pageTitle('signup') }}
  </v-btn>
</template>

<script>
export default {
}
</script>
<style>
.custom-button-signup {
  background-color: black;
  width: 300px;
  border-radius: 0;
}
</style>
