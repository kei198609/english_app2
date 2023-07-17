<template>
  <v-list-item>
    <v-list-item-avatar>
      <v-img :src="user.avatar && user.avatar.url ? user.avatar.url : noimage"
              @click="$router.push(`/users/${user.id}`)"
              class="clickable-image">
      </v-img>
    </v-list-item-avatar>
    <v-list-item-content>
      <v-list-item-title>
        <nuxt-link :to="`/top/${user.id}/mypage`">{{ user.name }}</nuxt-link>
      </v-list-item-title>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
export default {
  data () {
    return {
      noimage: require('~/assets/images/noimage.jpg')
    }
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
  .clickable-image {
    cursor: pointer;
  }
</style>
