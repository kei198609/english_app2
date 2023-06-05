<template>
  <v-text-field
    v-model="setOccupation"
    :rules="rules"
    :counter="max"
    label="職種を入力"
    placeholder="あなたの職種"
    outlined
  />
</template>

<script>
export default {
  props: {
    occupation: {
      type: String,
      default: ''
    }
  },
  data () {
    const max = 30
    return {
      max,
      rules: [
        v => !!v || '',
        v => (!!v && max >= v.length) || `${max}文字以内で入力してください`
      ]
    }
  },
  computed: {
    setOccupation: {
      get () {
        return this.occupation
      },
      set (newValue) {
        return this.$emit('update:occupation', newValue)
      }
    }
  }
}
</script>
