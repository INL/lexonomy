<dict-config-ske>
	<dict-config-nav dictId={ this.dictId } dictTitle={ this.props.dictDetails.title } configId={ this.configId } configTitle={ this.configTitle }/>
	<div>
		<div class="row">
			<h4>Sketch Engine connection</h4>
		</div>
			<div class="row">
        <div class="input-field col s10">
          <input value={ this.configData.kex.url } placeholder="" id="kex_url" type="text" class=""/>
					<label for="kex_url">Sketch Engine URL</label>
					<span class="helper-text">The URL of the Sketch Engine installation where external links should point. Defaults to <tt>https://app.sketchengine.eu</tt>. Do not change this unless you are using a local installation of Sketch Engine.</span>
				</div>
			</div>
			<div class="row">
        <div class="input-field col s10">
          <input value={ this.configData.kex.apiurl } placeholder="" id="kex_apiurl" type="text" class=""/>
					<label for="kex_apiurl">Sketch Engine API URL</label>
					<span class="helper-text">The path to the <tt>run.cgi</tt> API script in Sketch Engine. Defaults to <tt>https://api.sketchengine.eu/bonito/run.cgi</tt>. Do not change this unless you are using a local installation of Sketch Engine.</span>
				</div>
			</div>
			<template if={ this.props.userInfo.ske_username && this.props.userInfo.ske_apiKey && this.props.userInfo.ske_username != "" && this.props.userInfo.ske_apiKey != "" }>
				<div class="row">
					<div class="input-field col s10">
						<input data-selected-corpus={ this.configData.kex.corpus } type="text" id="kex_corpus" class="autocomplete" placeholder="Retrieving available corpora from Sketch Engine, please wait...">
						<label for="kex_corpus">Corpus name</label>
						<span class="helper-text">Select a Sketch Engine corpus from the list of corpora available to you.</span>
						<span class="helper-text" id="corpusInfo" hide={ true }></span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s10">
						<input value={ this.configData.kex.concquery} placeholder="" id="kex_concquery" type="text" class=""/>
						<label for="kex_concquery">Concordance query</label>
						<span class="helper-text">The CQL query that will be used to obtain concordance from Sketch Engine. You can use placeholders for elements in the form of '%(element)', e.g. '[lemma="%(headword)"]'. If left empty the 'simple' query type will be used as configured for the respective corpus. Please note that you cannot use CQL syntax with default attribute because it is not specified.</span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s10">
						<input value={ this.configData.kex.concsampling} placeholder="" id="kex_concsampling" type="number" class=""/>
						<label for="kex_concsampling">Sample size</label>
						<span class="helper-text">Whether to apply automatic sampling of the concordance. Any non-zero value means to automatically create a random sample of that size.</span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s10">
						<select id="kex_searchElements" multiple>
						</select>
						<label for="kex_searchElements">Additional search elements</label>
						<span class="helper-text">You can select any textual elements here whose content you would like to search for in Sketch Engine. A menu will be displayed next to all these elements like for the root entry element.</span>
					</div>
				</div>
			</template>
			<template if={ !this.props.userInfo.ske_username || !this.props.userInfo.ske_apiKey || this.props.userInfo.ske_apiKey == "" || this.props.userInfo.ske_username == "" }>
				<div class="card-panel amber lighten-2">
					Please setup your Sketch Engine account in your <a href='#/userprofile'>profile</a> settings to be able to select a corpus.
				</div>
			</template>
			<div class="row">
				<h4>Examples</h4>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<select id="xampl_container">
						<option value="">(not set)</option>
					</select>
					<label for="xampl_container">Example container</label>
					<span class="helper-text">Select the element which should wrap each individual example. When you pull example sentences automatically from a corpus, Lexonomy will insert one of these elements for each example sentence.</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<textarea id="xampl_template" class="materialize-textarea" placeholder="XML template">{ this.configData.xampl.template }</textarea>
					<label for="xampl_template">XML template</label>
					<span class="helper-text">This is the XML that will be inserted into your entries with each corpus example. The actual text will be where the placeholder <tt>$text</tt> is.</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<select id="xampl_markup">
						<option value="">(not set)</option>
					</select>
					<label for="xampl_markup">Headword mark-up</label>
					<span class="helper-text">Select the element which should mark up the headword in inserted corpus examples. This setting is optional: if you make no selection, corpus examples will be inserted without mark-up.</span>
				</div>
			</div>
			<div class="row">
				<h4>Collocations</h4>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<select id="collx_container">
						<option value="">(not set)</option>
					</select>
					<label for="collx_container">Collocation container</label>
					<span class="helper-text">Select the element which should wrap each collocation (the collocate plus any other data). When you pull collocations automatically from a corpus, Lexonomy will insert one of these elements for each collocation.</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<textarea id="collx_template" class="materialize-textarea" placeholder="XML template">{ this.configData.collx.template }</textarea>
					<label for="collx_template">XML template</label>
					<span class="helper-text">This is the XML that will be inserted into your entries with each collocation. The actual text will be where the placeholder <tt>$text</tt> is.</span>
				</div>
			</div>
			<div class="row">
				<h4>Thesaurus items</h4>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<select id="thes_container">
						<option value="">(not set)</option>
					</select>
					<label for="thes_container">Thesaurus item container</label>
					<span class="helper-text">Select the element which should wrap each individual thesaurus item (a word). When you pull thesaurus items automatically from a corpus, Lexonomy will insert one of these elements for each thesaurus item.</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<textarea id="thes_template" class="materialize-textarea" placeholder="XML template">{ this.configData.thes.template }</textarea>
					<label for="thes_template">XML template</label>
					<span class="helper-text">This is the XML that will be inserted into your entries with each thesaurus item. The actual text will be where the placeholder <tt>$text</tt> is.</span>
				</div>
			</div>
			<div class="row">
				<h4>Definitions</h4>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<select id="defo_container">
						<option value="">(not set)</option>
					</select>
					<label for="defo_container">Definition container</label>
					<span class="helper-text">Select the element which should wrap each definition. When you pull definitions automatically from a corpus, Lexonomy will insert one of these elements for each definition.</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<textarea id="defo_template" class="materialize-textarea" placeholder="XML template">{ this.configData.defo.template }</textarea>
					<label for="defo_template">XML template</label>
					<span class="helper-text">This is the XML that will be inserted into your entries with each definition. The actual text will be where the placeholder <tt>$text</tt> is.</span>
				</div>
			</div>
			<button class="btn waves-effect waves-light" onclick={ saveData } id="submit_button">Save <i class="material-icons right">save</i>
			</button>
	</div>
	<style>
		#kex_concsampling {
			width: 4em;
		}
		#kex_searchElements {
			width: 10em;
		}
	</style>
	<script>
		export default {
			dictId: '',
			configId: '',
			configTitle: 'Sketch Engine connection', 
			configData: {
				kex: {url: 'https://app.sketchengine.eu', apiurl: 'https://api.sketchengine.eu/bonito/run.cgi', concsampling: 0, searchElements: []},
				xampl: {container: '', template: '', markup: ''},
				collx: {container: '', template: ''},
				defo: {container: '', template: ''},
				thes: {container: '', template: ''},
			},
		
			onMounted() {
				this.dictId = this.props.dictId;
				this.configId = this.props.configId;
				console.log('config dict '+ this.dictId + '-' + this.configId)
				this.props.loadDictDetail();
				this.fillConfigForm();
				M.updateTextFields();
			},

			onUpdated() {
				if (this.props.dictConfigs.xema && this.props.dictConfigs.xema.elements) {
					if ($('#kex_searchElements option').length == 0) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
							if (info.filling == 'txt' || info.filling == 'lst') {
								var checked = this.configData.kex.searchElements.includes(key)? 'checked':'';
								$('#kex_searchElements').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
							}
						});
					}
					if ($('#xampl_container option').length == 1) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
								var checked = (this.configData.xampl.container == key)? 'checked':'';
								$('#xampl_container').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
						});
					}
					if ($('#xampl_markup option').length == 1) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
								var checked = (this.configData.xampl.markup == key)? 'checked':'';
								$('#xampl_markup').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
						});
					}
					if ($('#collx_container option').length == 1) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
								var checked = (this.configData.collx.container == key)? 'checked':'';
								$('#collx_container').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
						});
					}
					if ($('#defo_container option').length == 1) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
								var checked = (this.configData.defo.container == key)? 'checked':'';
								$('#defo_container').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
						});
					}
					if ($('#thes_container option').length == 1) {
						Object.entries(this.props.dictConfigs.xema.elements).forEach(([key, info]) => {
								var checked = (this.configData.thes.container == key)? 'checked':'';
								$('#thes_container').append('<option value="' + key + '" ' + checked + '>' + key + '</option>');
						});
					}
					$('select').formSelect();
				}
			},

			async fillConfigForm() {
				this.props.loadConfigData(this.configId).then((response)=>{
					this.configData = response;
					if (!this.configData.kex.concsampling || this.configData.kex.concsampling == '') {
						this.configData.kex.concsampling = 0;
					}
					if (!response.kex.searchElements) {
						this.configData.kex.searchElements = [];
					}
					M.updateTextFields();
					M.textareaAutoResize($('#xampl_template'));
					$('#kex_corpus').autocomplete({data: {}});
					$('#kex_corpus').data('corpora', {});
					if (this.configData.kex.corpus != '') {
						$('#kex_corpus').data('selected-corpora', this.configData.kex.corpus);
					}
					$.get({
						url: '/skeget/corpora'
					}).done(function(res) {
						var corporaList = {};
						var corporaData = {};
						var selected = '';
						res.data.forEach(e => {
              var size = "";
              if (e.sizes) {
                size = ", " + (e.sizes.tokencount / 1000000).toFixed(2) + "M tokens";
              }
							var eInfo = e.name + " (" + e.language_name + size + ")";
							corporaData[eInfo] = e.corpname;
							corporaList[eInfo] = null;
							if ($('#kex_corpus').data('selected-corpora') == e.corpname) {
								selected = eInfo;
								$('#corpusInfo').html('Currently selected corpus: ' + e.name + ", show <a href='" + $.trim($("#kex_url").val()) + "#dashboard?corp_info=1&corpname=" + encodeURIComponent(e.corpname) + "' target='ske'>detailed corpus info</a>.");
								$('#corpusInfo').show();
							}
						});
						$('#kex_corpus').autocomplete({data: corporaList});
						$('#kex_corpus').data('corpora', corporaData);
						$('#kex_corpus').attr('placeholder', 'Type to search in the list of corpora');
						if (selected != '') {
							$('#kex_corpus').val(selected);
						}
					});
					$('#kex_corpus').on('change', function() {
						var corporaData = $(this).data('corpora')
						$(this).data('selected-corpus', corporaData[$(this).val()]);
						$('#corpusInfo').html('Currently selected corpus: ' + $(this).val() + ", show <a href='" + $.trim($("#kex_url").val()) + "#dashboard?corp_info=1&corpname=" + encodeURIComponent(corporaData[$(this).val()]) + "' target='ske'>detailed corpus info</a>.");
						$('#corpusInfo').show();
					});

					this.configData.kex.searchElements.forEach(el => {
						$('#kex_searchElements option[value='+el+']').attr('selected','selected');
					});
					if (this.configData.xampl.container != '') {
						$('#xampl_container option[value='+this.configData.xampl.container+']').attr('selected','selected');
					}
					if (this.configData.xampl.markup != '') {
						$('#xampl_markup option[value='+this.configData.xampl.markup+']').attr('selected','selected');
					}
					if (this.configData.collx.container != '') {
						$('#collx_container option[value='+this.configData.collx.container+']').attr('selected','selected');
					}
					if (this.configData.thes.container != '') {
						$('#thes_container option[value='+this.configData.thes.container+']').attr('selected','selected');
					}
					if (this.configData.defo.container != '') {
						$('#defo_container option[value='+this.configData.defo.container+']').attr('selected','selected');
					}
					$('select').formSelect();
					this.update();
				});
			},

			getConfigData() {
				var newData = {
					kex: {
						url: $('#kex_url').val(),
						apiurl: $('#kex_apiurl').val(),
						corpus: $('#kex_corpus').data('selected-corpus'),
						concquery: $('#kex_concquery').val(),
						concsampling:$('#kex_concsampling').val(),
						searchElements: $('#kex_searchElements').val()
					},
					xampl: {
						container: $('#xampl_container').val(),
						template: $('#xampl_template').val(),
						markup: $('#xampl_markup').val(),
					},
					collx: {
						container: $('#collx_container').val(),
						template: $('#collx_template').val(),
					},
					defo: {
						container: $('#defo_container').val(),
						template: $('#defo_template').val(),
					},
					thes: {
						container: $('#thes_container').val(),
						template: $('#thes_template').val(),
					},
				};
				return newData;
			},

			saveData() {
				console.log(this.getConfigData())
				$('#submit_button').html('Saving...');
				this.props.saveConfigData(this.configId, this.getConfigData());
			}
		}
	</script>
	
</dict-config-ske>