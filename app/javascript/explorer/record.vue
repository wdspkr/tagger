<template>
  <div class="record card">
    <div class="card-body">
      <h5 class="card-title">{{ record.title }}</h5>
      <h6 class="card-subtitle mb-2 text-muted">{{ record.creator }}</h6>
    </div>
  </div>
</template>

<script>
export default {
  props: ["record"],
};
</script>
