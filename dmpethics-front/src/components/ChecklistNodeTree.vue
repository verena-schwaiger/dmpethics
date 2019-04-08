<!-- Renders nodes from the questionnaire data:
    Only shows requirements that are necessary according to user's filled out questionnaire data -->
<template>

  <div class="checklist-node-tree">
    <div class="wikiformfield">
        <div v-if="checklist.checked === true">
        <div v-for="requirement in checklist.requirements" :key="requirement.id" class="form-checklist-row">
            <input type="checkbox" class="form-check-input" v-model="checklist.requirementdone" :id="checklist.label" :value="checklist.id" :checked="checklist.requirementdone">
            <span v-if="checklist.requirementdone.checked">
                <label :for="requirement.label">{{ requirement }}</label>
            </span>
            <span v-else>
                <label :for="requirement.label" >{{ requirement }}</label>
            </span>
        </div>
      </div>        
      <checklist v-for="child in checklist.children" :checklist="child" :key="child.id"></checklist>
    </div>
  </div>

</template>

<script>
export default {
  name: "checklist",
  props: {
    checklist: Object
  },
  data() {
    return{
        answered: null    }
  },
  
methods: {

}
};
</script>