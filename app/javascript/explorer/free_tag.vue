<template>
  <div class="btn btn-info free-tag-button"
    v-on:click="filter"
    v-bind:class="{ active: tag.active, disabled: tag.disabled}">
    {{ tag.term }}
  </div>
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
