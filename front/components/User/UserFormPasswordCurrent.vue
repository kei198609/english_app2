<template>
  <v-text-field
    v-model="setPassword"
    :rules="form.rules"
    :hint="form.hint"
    label="現在のパスワード"
    :placeholder="form.placeholder"
    :hide-details="!setValidation"
    :counter="setValidation"
    :append-icon="toggle.icon"
    :type="toggle.type"
    outlined
    autocomplete="on"
    @click:append="show = !show"
  />
</template>

<script>
export default {
  props: {
    password: {
      type: String,
      default: ''
    },
    // バリデーションを切り替えるフラグ
    setValidation: {
      type: Boolean,
      default: false
    }
  },

  data () {
    return {
      show: false
    }
  },

  computed: {
    setPassword: {
      get () {
        return this.password
      },
      set (newValue) {
        return this.$emit('update:password', newValue)
      }
    },
    form () {
      const required = v => !!v || ''
      const rules = [required]
      const hint = undefined
      const placeholder = undefined
      return { rules, hint, placeholder }
    },
    toggle () {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    }
  }
}
</script>
