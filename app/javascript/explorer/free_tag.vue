<template>
  <div class="btn btn-secondary free-tag-button" v-on:click="filter">{{ tag.term }}</div>
</template>

<script>
export default {
  props: ["tag"],
  methods: {
    filter: function() {
      this.$emit("filter", this.tag.term);
    },
  },
};
</script>
