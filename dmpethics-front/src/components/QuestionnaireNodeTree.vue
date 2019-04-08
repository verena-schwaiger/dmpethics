<template>
  <div class="questionnaire-node-tree">
    <div v-if="questionData.label == 'root'" class="question">
       <div>
            <question v-for="child in questionData.children" :questionData="child" :key="child.id"></question>
       </div>
    </div>
    <div v-else class="question">
        <input type="checkbox" class="form-check-input" v-model="questionData.checked" :id="questionData.label" :value="questionData.id">
        <label :for="questionData.label" class="form-check-label">{{ questionData.label }}</label>
            <div class="box">
                <div v-if="questionData.checked && questionData.comment != ''" class="warning">
                    {{ questionData.comment }}
                </div>
            </div>
       <div v-if="questionData.checked">
            <question v-for="child in questionData.children" :questionData="child" :key="child.id"></question>
       </div>

    </div>
  </div>

</template>

<script>
export default {
  name: "question",
  props: {
    questionData: Object
  }
};
</script>