<!-- Renders nodes from the questionnaire data:
    Only shows requirements that are necessary according to user's filled out questionnaire data -->
<template>

  <div class="checklist-node-tree">
    <div class="wikiformfield">
      <div v-if="checklist.checked === true">
        <div v-for="requirement in checklist.requirements" :key="requirement.id" class="form-checklist-row">
            <input type="checkbox" class="form-check-input" v-model="requirement.checked" :id="checklist.label" :value="checklist.id" :checked="requirement.checked">
            <span v-if="requirement.checked">
                <label :for="requirement.reqlabel" class="requirement">{{ requirement.reqlabel }}</label>
            </span>
            <span v-else>
                <label :for="requirement.reqlabel">{{ requirement.reqlabel }}</label>
                <span class="wikilink">(<a :href="'http://localhost/smw/index.php/Special:FormEdit/Upload?Files%5BStudyTitle%5D=' + encodeURI(studytitle) + '&Files[FileType]=' + encodeURI(requirement.reqlabel) + '&Files[PID]=' + encodeURI(generatePID())">Upload to Wiki</a>)</span>
            </span>
        </div>
      </div>        
      <checklist v-for="child in checklist.children" :checklist="child" :studytitle="studytitle" :key="child.id"></checklist>
    </div>
  </div>

</template>

<script>
export default {
  name: "checklist",
  props: {
    checklist: Object,
    studytitle: Number
  },
  data() {
    return{
      answered: null
    }
  },
  
methods: {
  generatePID(){
    return this.studytitle + "-" +  Math.floor((Math.random() * 10000) + 1); 
  }
}
};
</script>