<template>
  <v-col cols="4">
    <v-card>
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
  </v-col>
</template>

<script>
export default {
  props: ['items']
}
</script>
