

 <dl>
    <dt><code>set_id</code></dt>
    <dd><strong>string</strong></dd>
    <dd>The Set ID, A globally unique identifier (GUID) for the labeling, stable across all versions or revisions.</dd>
    <dt><code>id</code></dt>
    <dd><strong>string</strong></dd>
    <dd>The document ID, A globally unique identifier (GUID) for the particular revision of a labeling document.</dd>
    <dt><code>version</code></dt>
    <dd><strong>string integer</strong></dd>
    <dd>A sequentially increasing number identifying the particular version of a document, starting with <code>1</code>.</dd>
    <dt><code>effective_time</code></dt>
    <dd><strong>string date <em>YYYYmmdd</em></strong></dd>
    <dd>Date reference to the particular version of the labeling document.</dd>
  </dl>

  <h3 id="abuse-and-overdosage">Abuse and overdosage</h3>

  <dl>
    <dt><code>drug_abuse_and_dependence</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about whether the drug is a controlled substance, the types of abuse that can occur with the drug, and adverse reactions pertinent to those types of abuse.</dd>
    <dt><code>controlled_substance</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about the schedule in which the drug is controlled by the Drug Enforcement Administration, if applicable.</dd>
    <dt><code>abuse</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about the types of abuse that can occur with the drug and adverse reactions pertinent to those types of abuse, primarily based on human data. May include descriptions of particularly susceptible patient populations.</dd>
    <dt><code>dependence</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about characteristic effects resulting from both psychological and physical dependence that occur with the drug, the quantity of drug over a period of time that may lead to tolerance or dependence, details of adverse effects related to chronic abuse and the effects of abrupt withdrawl, procedures necessary to diagnose the dependent state, and principles of treating the effects of abrupt withdrawal.</dd>
    <dt><code>overdosage</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>some OTC</em></dd>
    <dd>Information about signs, symptoms, and laboratory findings of acute ovedosage and the general principles of overdose treatment.</dd>
  </dl>

  <h3 id="adverse-effects-and-interactions">Adverse effects and interactions</h3>

  <dl>
    <dt><code>adverse_reactions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>some OTC</em></dd>
    <dd>Information about undesirable effects, reasonably associated with use of the drug, that may occur as part of the pharmacological action of the drug or may be unpredictable in its occurrence. Adverse reactions include those that occur with the drug, and if applicable, with drugs in the same pharmacologically active and chemically related class. There is considerable variation in the listing of adverse reactions. They may be categorized by organ system, by severity of reaction, by frequency, by toxicological mechanism, or by a combination of these.</dd>
    <dt><code>drug_interactions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about and practical guidance on preventing clinically significant drug/drug and drug/food interactions that may occur in people taking the drug.</dd>
    <dt><code>drug_and_or_laboratory_test_interactions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about any known interference by the drug with laboratory tests.</dd>
  </dl>

  <h3 id="clinical-pharmacology">Clinical pharmacology</h3>

  <dl>
    <dt><code>clinical_pharmacology</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about the clinical pharmacology and actions of the drug in humans.</dd>
    <dt><code>mechanism_of_action</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about the established mechanism(s) of the drug�s action in humans at various levels (for example receptor, membrane, tissue, organ, whole body). If the mechanism of action is not known, this field contains a statement about the lack of information.</dd>
    <dt><code>pharmacodynamics</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about any biochemical or physiologic pharmacologic effects of the drug or active metabolites related to the drug�s clinical effect in preventing, diagnosing, mitigating, curing, or treating disease, or those related to adverse effects or toxicity.</dd>
    <dt><code>pharmacokinetics</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em></dd>
    <dd>Information about the clinically significant pharmacokinetics of a drug or active metabolites, for instance pertinent absorption, distribution, metabolism, and excretion parameters.</dd>
  </dl>

  <h3 id="indications-usage-and-dosage">Indications, usage, and dosage</h3>

  <dl>
    <dt><code>indications_and_usage</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>OTC</em></dd>
    <dd>A statement of each of the drug product�s indications for use, such as for the treatment, prevention, mitigation, cure, or diagnosis of a disease or condition, or of a manifestation of a recognized disease or condition, or for the relief of symptoms associated with a recognized disease or condition. This field may also describe any relevant limitations of use.</dd>
    <dt><code>contraindications</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about situations in which the drug product is contraindicated or should not be used because the risk of use clearly outweighs any possible benefit, including the type and nature of reactions that have been reported.</dd>
    <dt><code>dosage_and_administration</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>OTC</em></dd>
    <dd>Information about the drug product�s dosage and administration recommendations, including starting dose, dose range, titration regimens, and any other clinically sigificant information that affects dosing recommendations.</dd>
    <dt><code>dosage_forms_and_strengths</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about all available dosage forms and strengths for the drug product to which the labeling applies. This field may contain descriptions of product appearance.</dd>
    <dt><code>purpose</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>OTC</em></dd>
    <dd>Information about the drug product�s indications for use.</dd>
    <dt><code>description</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>some OTC</em></dd>
    <dd>General information about the drug product, including the proprietary and established name of the drug, the type of dosage form and route of administration to which the label applies, qualitative and quantitative ingredient information, the pharmacologic or therapeutic class of the drug, and the chemical name and structural formula of the drug.</dd>
    <dt><code>active_ingredient</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>OTC</em></dd>
    <dd>A list of the active, medicinal ingredients in the drug product.</dd>
    <dt><code>inactive_ingredient</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>OTC</em></dd>
    <dd>A list of inactive, non-medicinal ingredients in a drug product.</dd>
    <dt><code>spl_product_data_elements</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>OTC</em></dd>
    <dd>Usually a list of ingredients in a drug product.</dd>
  </dl>

  <h3 id="patient-information">Patient information</h3>

  <dl>
    <dt><code>spl_patient_package_insert</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information necessary for patients to use the drug safely and effectively.</dd>
    <dt><code>information_for_patients</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>some OTC</em></dd>
    <dd>Information necessary for patients to use the drug safely and effectively, such as precautions concerning driving or the concomitant use of other substances that may have harmful additive effects.</dd>
    <dt><code>information_for_owners_or_caregivers</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>few OTC</em></dd>
    <dd>Documentation forthcoming.</dd>
    <dt><code>instructions_for_use</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>some OTC</em></dd>
    <dd>Information about safe handling and use of the drug product.</dd>
    <dt><code>ask_doctor</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>many OTC</em></dd>
    <dd>Information about when a doctor should be consulted about existing conditions or sumptoms before using the drug product, including all warnings for persons with certain preexisting conditions (excluding pregnancy) and all warnings for persons experiencing certain symptoms. The warnings under this heading are those intended only for situations in which consumers should not use the product until a doctor is consulted.</dd>
    <dt><code>ask_doctor_or_pharmacist</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>very few prescription</em> / <em>some OTC</em></dd>
    <dd>Information about when a doctor or pharmacist should be consulted about drug/drug or drug/food interactions before using a drug product.</dd>
    <dt><code>do_not_use</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>many OTC</em></dd>
    <dd>Information about all contraindications for use. These contraindications are absolute and are intended for situations in which consumers should not use the product unless a prior diagnosis has been established by a doctor or for situations in which certain consumers should not use the product under any circumstances regardless of whether a doctor or health professional is consulted.</dd>
    <dt><code>keep_out_of_reach_of_children</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>OTC</em></dd>
    <dd>Information pertaining to whether the product should be kept out of the reach of children, and instructions about what to do in the case of accidental contact or ingestion, if appropriate.</dd>
    <dt><code>other_safety_information</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>some OTC</em></dd>
    <dd>Information about safe use and handling of the product that may not have been specified in another field.</dd>
    <dt><code>questions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>many OTC</em></dd>
    <dd>A telephone number of a source to answer questions about a drug product. Sometimes available days and times are also noted.</dd>
    <dt><code>stop_use</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>many OTC</em></dd>
    <dd>Information about when use of the drug product should be discontinued immediately and a doctor consulted. Includes information about any signs of toxicity or other reactions that would necessitate immediately discontinuing use of the product.</dd>
    <dt><code>when_using</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em> / <em>many OTC</em></dd>
    <dd>Information about side effects that people may experience, and the substances (e.g. alcohol) or activities (e.g. operating machinery, driving a car) to avoid while using the drug product.</dd>
    <dt><code>patient_medication_information</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>few prescription</em></dd>
    <dd>Information or instructions to patients about safe use of the drug product, sometimes including a reference to a patient medication guide or counseling materials.</dd>
    <dt><code>spl_medguide</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Information about the patient medication guide that accompanies the drug product. Certain drugs must be dispensed with an accompanying medication guide. This field may contain information about when to consult the medication guide and the contents of the medication guide.</dd>
  </dl>

  <h3 id="special-populations">Special populations</h3>

  <dl>
    <dt><code>use_in_specific_populations</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>very few OTC</em></dd>
    <dd>Information about use of the drug by patients in specific populations, including pregnant women and nursing mothers, pediatric patients, and geriatric patients.</dd>
    <dt><code>pregnancy</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about effects the drug may have on pregnant women or on a fetus. This field may be ommitted if the drug is not absorbed systemically and the drug is not known to have a potential for indirect harm to the fetus. It may contain information about the established pregnancy category classification for the drug. (That information is nominally listed in the <code>teratogenic_effects</code> field, but may be listed here instead.)</dd>
    <dt><code>teratogenic_effects</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd><em>Pregnancy category A:</em> Adequate and well-controlled studies in pregnant women have failed to demonstrate a risk to the fetus in the first trimester of pregnancy, and there is no evidence of a risk in later trimesters.</dd>
    <dd><em>Pregnancy category B:</em> Animal reproduction studies have failed to demonstrate a risk to the fetus and there are no adequate and well-controlled studies in pregnant women.</dd>
    <dd><em>Pregnancy category C:</em> Animal reproduction studies have shown an adverse effect on the fetus, there are no adequate and well-controlled studies in humans, and the benefits from the use of the drug in pregnant women may be acceptable despite its potential risks.</dd>
    <dd><em>Pregnancy category D:</em> There is positive evidence of human fetal risk based on adverse reaction data from investigational or marketing experience or studies in humans, but the potential benefits from the use of the drug in pregnant women may be acceptable despite its potential risks (for example, if the drug is needed in a life-threatening situation or serious disease for which safer drugs cannot be used or are ineffective).</dd>
    <dd><em>Pregnancy category X:</em> Studies in animals or humans have demonstrated fetal abnormalities or there is positive evidence of fetal risk based on adverse reaction reports from investigational or marketing experience, or both, and the risk of the use of the drug in a pregnant woman clearly outweighs any possible benefit (for example, safer drugs or other forms of therapy are available).</dd>
    <dt><code>nonteratogenic_effects</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Other information about the drug�s effects on reproduction and the drug�s use during pregnancy, if the information is relevant to the safe and effective use of the drug.</dd>
    <dt><code>labor_and_delivery</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Information about the drug�s use during labor or delivery, whether or not the use is stated in the indications section of the labeling, including the effect of the drug on the mother and fetus, on the duration of labor or delivery, on the possibility of delivery-related interventions, and the effect of the drug on the later growth, development, and functional maturation of the child.</dd>
    <dt><code>nursing_mothers</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>very few OTC</em></dd>
    <dd>Information about excretion of the drug in human milk and effects on the nursing infant, including pertinent adverse effects observed in animal offspring.</dd>
    <dt><code>pregnancy_or_breast_feeding</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>many prescription</em> / <em>few OTC</em></dd>
    <dd>Documentation forthcoming.</dd>
    <dt><code>pediatric_use</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>very few OTC</em></dd>
    <dd>Information about any limitations on any pediatric indications, needs for specific monitoring, hazards associated with use of the drug in any subsets of the pediatric population (such as neonates, infants, children, or adolescents), differences between pediatric and adult responses to the drug, and other information related to the safe and effective pediatric use of the drug.</dd>
    <dt><code>geriatric_use</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>most prescription</em> / <em>very few OTC</em></dd>
    <dd>Information about any limitations on any geriatric indications, needs for specific monitoring, hazards associated with use of the drug in the geriatric population.</dd>
  </dl>

  <h3 id="nonclinical-toxicology">Nonclinical toxicology</h3>

  <dl>
    <dt><code>nonclinical_toxicology</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Information about toxicology in non-human subjects.</dd>
    <dt><code>carcinogenesis_and_mutagenesis_and_impairment_of_fertility</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>most prescription</em> / <em>very few OTC</em></dd>
    <dd>Information about carcinogenic, mutagenic, or fertility impairment potential revealed by studies in animals. Information from human data about such potential is part of the <code>warnings</code> field.</dd>
    <dt><code>animal_pharmacology_and_or_toxicology</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Information from studies of the drug in animals, if the data were not relevant to nor included in other parts of the labeling. Most labels do not contain this field.</dd>
  </dl>

  <h3 id="references">References</h3>

  <dl>
    <dt><code>clinical_studies</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>few OTC</em></dd>
    <dd>This field may contain references to clinical studies in place of detailed discussion in other sections of the labeling.</dd>
    <dt><code>references</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>few OTC</em></dd>
    <dd>This field may contain references when prescription drug labeling must summarize or otherwise relay on a recommendation by an authoritative scientific body, or on a standardized methodology, scale, or technique, because the information is important to prescribing decisions.</dd>
  </dl>

  <h3 id="supply-storage-and-handling">Supply, storage, and handling</h3>

  <dl>
    <dt><code>how_supplied</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>few OTC</em></dd>
    <dd>Information about the available dosage forms to which the labeling applies, and for which the manufacturer or distributor is responsible. This field ordinarily includes the strength of the dosage form (in metric units), the units in which the dosage form is available for prescribing, appropriate information to facilitate identification of the dosage forms (such as shape, color, coating, scoring, and National Drug Code), and special handling and storage condition information.</dd>
    <dt><code>storage_and_handling</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>many prescription</em> / <em>many OTC</em></dd>
    <dd>Information about safe storage and handling of the drug product.</dd>
    <dt><code>safe_handling_warning</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>very few prescription</em> / <em>few OTC</em></dd>
    <dd>Documentation forthcoming.</dd>
  </dl>

  <h3 id="warnings-and-precautions">Warnings and precautions</h3>

  <dl>
    <dt><code>boxed_warning</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>few OTC</em></dd>
    <dd>Information about contraindications or serious warnings, particularly those that may lead to death or serious injury.</dd>
    <dt><code>warnings_and_precautions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>few OTC</em></dd>
    <dd>Information about clinically significant safety concerns that affect decisions about whether to prescribe the drug product, recommendations for patient monitoring to ensure safe use of the drug, and measure that can be taken to prevent or mitigate harm.</dd>
    <dt><code>user_safety_warnings</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>very few prescription</em> / <em>very few OTC</em></dd>
    <dd>When a drug can pose a hazard to human health by contact, inhalation, ingestion, injection, or by any exposure, this field contains information which can prevent or decrease the possibility of harm.</dd>
    <dt><code>precautions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>many prescription</em> / <em>few OTC</em></dd>
    <dd>Information about any special care to be exercised for safe and effective use of the drug.</dd>
    <dt><code>warnings</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>OTC</em></dd>
    <dd>Information about serious adverse reactions and potential safety hazards, including limitations in use imposed by those hazards and steps that should be taken if they occur.</dd>
    <dt><code>general_precautions</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>many prescription</em> / <em>few OTC</em></dd>
    <dd>Information about any special care to be exercised for safe and effective use of the drug.</dd>
  </dl>

  <h3 id="other-fields">Other fields</h3>

  <dl>
    <dt><code>laboratory_tests</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Information on laboratory tests helpful in following the patient�s response to the drug or in identifying possible adverse reactions. If appropriate, information may be provided on such factors as the range of normal and abnormal values expected in the particular situation and the recommended frequency with which tests should be performed before, during, and after therapy.</dd>
    <dt><code>recent_major_changes</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>A list of the section(s) of the that contain substantive changes that have been approved by FDA in the product labeling. The headings and subheadings, if appropriate, affected by the change are listed together with each section�s identifying number and the month and year on which the change was incorporated in the labeling.</dd>
    <dt><code>microbiology</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em></dd>
    <dd>Documentation forthcoming.</dd>
    <dt><code>package_label_principal_display_panel</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>prescription</em> / <em>OTC</em></dd>
    <dd>The content of the principal display panel of the product package, usually including the product�s name, dosage forms, and other key information about the drug product.</dd>
    <dt><code>spl_unclassified_section</code></dt>
    <dd><strong>list of strings</strong></dd>
    <dd><em>some prescription</em> / <em>some OTC</em></dd>
    <dd>Information not classified as belonging to one of the other fields. Approximately 40% of labeling with <code>effective_time</code> between June 2009 and August 2014 have information in this field.</dd>
  </dl>
