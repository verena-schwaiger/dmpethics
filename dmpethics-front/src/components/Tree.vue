<template>
  <node-tree :node="questionData"></node-tree>
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
