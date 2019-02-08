<template>
  <div class="container">
      <node-tree :node="questionData"></node-tree>
  </div>
</template>

<script>
import NodeTree from "./NodeTree";

export default {
  props: {
    questionData: Object
  },
  components: {
    NodeTree
  }
};
</script>
