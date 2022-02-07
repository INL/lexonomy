<dict-config-xemplate>
	<dict-config-nav dictId={ this.dictId } dictTitle={ this.props.dictDetails.title } configId={ this.configId } configTitle={ this.configTitle }/>
	<div if={ (!this.configData._xsl || this.configData._xsl == "") && (!this.configData._css || this.configData._css == "") && !this.override }>
		<div class="row designer" id="editor">
		</div>
		<div class="row">
			<div class="col s10">
				<button class="btn waves-effect waves-light" onclick={ startOverride } >Use your own stylesheet <i class="material-icons right">edit</i>
				</button>
			</div>
		</div>
	</div>
	<div if={ (this.configData._xsl && this.configData._xsl != "") || (this.configData._css && this.configData._css != "") || this.override }>
		<div class="row">
			<div class="input-field col s10">
				<textarea id="editor_xsl" class="materialize-textarea" placeholder="">{ this.configData._xsl }</textarea>
				<label for="editor_xsl">XSL</label>
				<span class="helper-text">Custom XSL stylesheet. If you would like to see an example, <a onclick={ exampleXsl }>click here to load a sample XSL</a>.</span>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s10">
				<textarea id="editor_css" class="materialize-textarea" placeholder="">{ this.configData._css }</textarea>
				<label for="editor_css">CSS</label>
				<span class="helper-text">Custom CSS stylesheet. If you would like to see an example, <a onclick={ exampleCss }>click here to load a sample CSS</a>.</span>
			</div>
		</div>

		<div class="row">
			<div class="col s10">
				<button class="btn waves-effect waves-light" onclick={ stopOverride } >Stop using your own stylesheet <i class="material-icons right">edit</i>
				</button>
			</div>
		</div>
	</div>
	<button class="btn waves-effect waves-light" onclick={ saveData } id="submit_button">Save <i class="material-icons right">save</i>
	</button>

	<style>
		#editor {
			position: relative !important;
			min-height: 1050px;
		}
		#editor .list {
			width: 25% !important;
		}
		#editor .details {
			left: 25% !important;
			width: 35% !important;
		}
		#editor .preview {
			left: 60% !important;
			width: 40% !important;
		}
		#editor.designer input[type=radio] {
			opacity: 1 !important;
		}
	</style>

	<script>
		export default {
			dictId: '',
			configId: '',
			configTitle: 'Entry formatting',
			override: false,
			configData: {},

			startOverride() {
				this.override = true;
				this.update();
			},

			stopOverride() {
				this.override = false;
				delete this.configData._xsl;
				delete this.configData._css;
				this.update();
				XemplateDesigner.start(this.props.dictConfigs.xema, this.configData, this.dictId);
			},

			exampleXsl() {
				$('#editor_xsl').val(
`<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="entry">
    <div class='myEntry'><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="headword">
    <span class='myHeadword'><xsl:apply-templates/></span>
  </xsl:template>
</xsl:stylesheet>
`);
				M.textareaAutoResize($('#editor_xsl'));
				M.updateTextFields();
			},

			exampleCss() {
				$('#editor_css').val(
`div.myEntry {font-family: serif; font-size: 1.25em}
div.myEntry span.myHeadword {font-weight: bold}
`);
				M.textareaAutoResize($('#editor_css'));
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
					if ((this.configData._xsl && this.configData._xsl != "") || (this.configData._css && this.configData._css != "")) {
						this.override = true;
						this.update();
						M.updateTextFields();
						M.textareaAutoResize($('#editor_css'));
						M.textareaAutoResize($('#editor_xsl'));
					} else {
						this.update();
					}
				});
			},

			onUpdated() {
				if (this.props.dictConfigs.xema && this.configData != {} && !this.override) {
					XemplateDesigner.start(this.props.dictConfigs.xema, this.configData, this.dictId);
				}
			},

			getConfigData() {
				var newData = {};
				if (XemplateDesigner.xemplate) {
					newData = XemplateDesigner.xemplate;
				}
				if (this.override) {
					if ($('#editor_css').val() != "") newData._css = $('#editor_css').val();
					if ($('#editor_xsl').val() != "") newData._xsl = $('#editor_xsl').val();
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
	
</dict-config-xemplate>