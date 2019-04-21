<!-- Renders nodes from the questionnaire data:
    Only shows requirements that are necessary according to user's filled out questionnaire data -->
<template>
  <div class="answer-node-tree">
    <div class="wikiformfield">
      <div v-if="answers.checked === true">
        <div v-for="requirement in answers.requirements" :key="requirement.id" class="form-wiki-docs">
          <label :for="requirement" class="">{{ requirement }}</label>
          <span class="wikilink"><a :href="'http://localhost/smw/index.php/Special:FormEdit/Upload?Files%5BStudyTitle%5D=' + encodeURI(studytitle) + '&Files[FileType]=' + encodeURI(requirement)">Upload to Wiki</a></span>
          <!--<input type="file" id="file" @change="handleFile" class="form-checklist-row"/>-->
        </div>
      </div>        
      <answer v-for="child in answers.children" :answers="child" :studytitle="studytitle" :key="child.id"></answer>

    </div>
  </div>

</template>

<script>
export default {
  name: "answer",
  props: {
    answers: Object,
    studytitle: String
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