<template>
  <v-card class="mb-1">
    <v-list-item :to="`/top/${user.id}/mypage`">
      <v-list-item-avatar>
        <v-img :src="user.avatar && user.avatar.url ? user.avatar.url : noimage"
                class="clickable-image">
        </v-img>
      </v-list-item-avatar>
      <v-list-item-content>
        <v-list-item-title>
          {{ user.name }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-card>
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
