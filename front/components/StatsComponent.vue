<template>
  <v-row class="d-flex">
    <v-col class="text-center" cols="6">
      <router-link :to="'/following/' + user.id" class="link-dark">
        <strong id="following">
          <!-- {{ user.following.length }}<br> -->
        </strong>
        フォロー
      </router-link>
    </v-col>
    <v-col class="text-center" cols="6">
      <router-link :to="'/followers/' + user.id" class="link-dark">
        <strong id="followers">
          <!-- {{ user.followers.length }}<br> -->
        </strong>
        フォロワー
      </router-link>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
.text-center {
  text-align: center;
}
.link-dark {
  color: #343a40;
}
</style>
