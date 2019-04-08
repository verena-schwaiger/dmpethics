<!-- Renders nodes from the questionnaire data:
    Only shows requirements that are necessary according to user's filled out questionnaire data -->
<template>
  <div class="answer-node-tree">

    <div class="wikiformfield">
      <div v-if="answers.checked === true">
        <div v-for="requirement in answers.requirements" :key="requirement.id" class="form-wiki-field">
          <label :for="requirement" class="">{{ requirement }}</label>
          <input type="file" id="file" @change="handleFile"/>
        </div>

      </div>        
      <answer v-for="child in answers.children" :answers="child" :key="child.id"></answer>

    </div>
  </div>

</template>

<script>
export default {
  name: "answer",
  props: {
    answers: Object
  },
  data() {
    return{
        answered: null    }
  },
  
methods: {
    handleFile:function() {
    }
}
};
</script>