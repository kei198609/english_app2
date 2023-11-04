<template>
  <v-card class="bordered-card">
    <v-list>
      <v-list-item v-for="item in items" :key="item.title" :to="item.link" link>
        <v-list-item-content>
          <v-list-item-title>
            {{ item.title }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
export default {
  props: ['items']
}
</script>

<style scoped>
.bordered-card {
  border-top: 3px solid #7097C3;
}
</style>
