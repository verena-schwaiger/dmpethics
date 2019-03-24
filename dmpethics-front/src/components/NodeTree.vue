<template>
  <div class="node-tree">
    <div v-if="node.label == 'root'" class="question">
       <div>
            <node v-for="child in node.children" :node="child" :key="child.id"></node>
       </div>
    </div>
    <div v-else class="question">
        <input type="checkbox" class="form-check-input" v-model="node.checked" :id="node.label" :value="node.id">
        <label :for="node.label" class="form-check-label">{{ node.label }}</label>
            <div class="box">
                <div v-if="node.checked && node.comment != ''" class="warning">
                    {{ node.comment }}
                </div>
            </div>
       <div v-if="node.checked">
            <node v-for="child in node.children" :node="child" :key="child.id"></node>
       </div>

    </div>
  </div>

</template>

<script>
export default {
  name: "node",
  props: {
    node: Object
  }
};
</script>