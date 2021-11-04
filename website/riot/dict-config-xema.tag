<dict-config-xema>
	<dict-config-nav dictId={ this.dictId } dictTitle={ this.props.dictDetails.title } configId={ this.configId } configTitle={ this.configTitle }/>
	<div if={ (!this.configData._xonomyDocSpec || this.configData._xonomyDocSpec == "") && (!this.configData._dtd || this.configData._dtd == "") && !this.override }>
		<div class="row">
			<div id="editor" class="col s12">
			</div>
		</div>
		<div class="row">
			<div class="col s10">
				<button class="btn waves-effect waves-light" onclick={ startOverride } >Use your own schema <i class="material-icons right">edit</i>
				</button>
			</div>
		</div>
	</div>
	<div if={ (this.configData._xonomyDocSpec && this.configData._xonomyDocSpec != "") || (this.configData._dtd && this.configData._dtd != "") || this.override }>
		<div class="row">
			<div class="col s10">
				<p>To specify your custom Lexonomy schema use either <i>Xonomy Document Specification</i>, or <i>DTD</i>.</p>
				<h5>Xonomy Document Specification</h5>
				<p>A <a href="http://www.lexiconista.com/xonomy/" target="_blank">Xonomy Document Specification</a> is a JavaScript object which configures the Xonomy XML editor used in Lexonomy.</p>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s10">
				<textarea id="editor_doc" class="materialize-textarea" placeholder="">{ this.configData._xonomyDocSpec }</textarea>
				<label for="editor_doc">Document specification</label>
				<span class="helper-text">Xonomy Document Specification. If you would like to see an example, <a onclick={ exampleDoc }>click here to load a sample specification</a>.</span>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s10">
				<textarea id="editor_xml" class="materialize-textarea" placeholder="">{ this.configData._css }</textarea>
				<label for="editor_xml">Template for new entries</label>
				<span class="helper-text">XML template for newly created entries. If you would like to see an example, <a onclick={ exampleXML }>click here to load a sample XML template</a>.</span>
			</div>
		</div>
		<div class="row">
			<div class="col s10">
				<h5>DTD (Document Type Defition)</h5>
				<p><a href="https://en.wikipedia.org/wiki/Document_type_definition" target="_blank">Document Type Definitions</a> are a popular formalism for defining the structure of XML documents.</p>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s10">
				<textarea id="editor_dtd" class="materialize-textarea" placeholder="">{ this.configData._dtd }</textarea>
				<label for="editor_dtd">Your DTD</label>
				<span class="helper-text">If you would like to see an example, <a onclick={ exampleDTD }>click here to load a sample DTD</a>.</span>
			</div>
		</div>

		<div class="row">
			<div class="col s10">
				<button class="btn waves-effect waves-light" onclick={ stopOverride } >Stop using your own schema <i class="material-icons right">edit</i>
				</button>
			</div>
		</div>
	</div>
	<button class="btn waves-effect waves-light" onclick={ saveData } id="submit_button">Save <i class="material-icons right">save</i>
	</button>

	<style>
		#editor {
			position: relative !important;
			min-height: 750px;
		}
		#editor .list {
			width: 25% !important;
		}
		#editor .details {
			left: 25% !important;
		}
		#editor.designer input.textbox.cap {
			width: 15em !important;
		}
	</style>

	<script>
		export default {
			dictId: '',
			configId: '',
			configTitle: 'Entry structure',
			override: false,
			configData: {},

			startOverride() {
				this.override = true;
				this.update();
			},

			stopOverride() {
				this.override = false;
				delete this.configData._xonomyDocSpec;
				delete this.configData._dtd;
				delete this.configData._newXml;
				this.update();
				XemaDesigner.start(this.configData);
			},

			exampleDoc() {
				$('#editor_doc').val(
`{
  elements: {
    "entry": {},
    "headword": {hasText: true}
  }
}`);
				M.textareaAutoResize($('#editor_doc'));
				M.updateTextFields();
			},

			exampleXML() {
				$('#editor_xml').val(
`<entry><headword></headword></entry>
`);
				M.textareaAutoResize($('#editor_xml'));
				M.updateTextFields();
			},

			exampleDTD() {
				$('#editor_dtd').val(
`<!ELEMENT entry (headword)>
<!ELEMENT headword (#PCDATA)>`);
				M.textareaAutoResize($('#editor_dtd'));
				M.updateTextFields();
			},

			onMounted() {
				this.dictId = this.props.dictId;
				this.configId = this.props.configId;
				console.log('config dict '+ this.dictId + '-' + this.configId)
				this.props.loadDictDetail();
				this.fillConfigForm();
				console.log(this.props);
			},

			async fillConfigForm() {
				this.props.loadConfigData(this.configId).then((response)=>{
					this.configData = response;
					if ((this.configData._xonomyDocSpec && this.configData._xonomyDocSpec != "") || (this.configData._dtd && this.configData._dtd != "")) {
						this.override = true;
						this.update();
						M.updateTextFields();
						M.textareaAutoResize($('#editor_doc'));
						M.textareaAutoResize($('#editor_xml'));
						M.textareaAutoResize($('#editor_dtd'));
					} else {
						XemaDesigner.start(this.configData);
					}
					console.log(this.configData)
				});
			},

			getConfigData() {
				var newData = {};
				if (XemaDesigner.xema.elements) {
					for(var el in XemaDesigner.xema.elements){
						for(var prop in XemaDesigner.xema.elements[el]){
							if(prop.indexOf("_")==0) delete XemaDesigner.xema.elements[el][prop];
						}
					}
					newData = XemaDesigner.xema;
				}
				if (this.override) {
					if ($('#editor_doc').val() != "") newData._xonomyDocSpec = $('#editor_doc').val();
					if ($('#editor_xml').val() != "") newData._newXml = $('#editor_xml').val();
					if ($('#editor_dtd').val() != "") newData._dtd = $('#editor_dtd').val();
				}
				return newData;
			},

			saveData() {
				console.log(this.getConfigData())
				$('#submit_button').html('Saving...');
				this.props.saveConfigData(this.configId, this.getConfigData());
			}
		}
	</script>
	
</dict-config-xema>
