<template>
  <v-col cols="4">
    <v-list dense>
      <v-list-item v-for="item in items" :key="item.title" link>
        <v-list-item-content>
          <v-list-item-title>
            <router-link :to="item.link">{{ item.title }}</router-link>
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-col>
</template>

<script>
export default {
  props: ['items']
}
</script>
