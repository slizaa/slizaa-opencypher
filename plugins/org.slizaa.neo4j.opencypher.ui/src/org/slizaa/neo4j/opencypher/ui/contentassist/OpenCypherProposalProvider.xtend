/*
 * generated by Xtext 2.10.0
 */
package org.slizaa.neo4j.opencypher.ui.contentassist

import com.google.common.collect.Sets
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.Keyword
import org.eclipse.xtext.RuleCall
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor
import org.slizaa.neo4j.opencypher.spi.IGraphMetaDataProvider
import org.slizaa.neo4j.opencypher.ui.internal.CustomOpenCypherActivator

/**
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#content-assist
 * on how to customize the content assistant.
 */
class OpenCypherProposalProvider extends AbstractOpenCypherProposalProvider {

	private static final Set<String> WHITELIST_KEYWORDS = Sets.newHashSet("DISTINCT", "=", "<>", "<", ">", "<=", ">=",
		"NOT", "OR", "XOR", "AND");

	override completeKeyword(Keyword keyword, ContentAssistContext contentAssistContext,
		ICompletionProposalAcceptor acceptor) {

		if (WHITELIST_KEYWORDS.contains(keyword.getValue())) {
			super.completeKeyword(keyword, contentAssistContext, acceptor);
		}
	}

	override complete_LabelName(EObject model, RuleCall ruleCall, ContentAssistContext context,
		ICompletionProposalAcceptor acceptor) {
		super.complete_LabelName(model, ruleCall, context, acceptor);

		val IGraphMetaDataProvider adaptor = CustomOpenCypherActivator.customOpenCypherActivator.
			currentGraphMetaDataProvider;

		if (adaptor !== null) {
			adaptor.nodeLabels.forEach[label|acceptor.accept(createCompletionProposal(label, context));]
		}
	}

	override complete_PropertyKeyName(EObject model, RuleCall ruleCall, ContentAssistContext context,
		ICompletionProposalAcceptor acceptor) {
		super.complete_PropertyKeyName(model, ruleCall, context, acceptor)

		val IGraphMetaDataProvider adaptor = CustomOpenCypherActivator.customOpenCypherActivator.
			currentGraphMetaDataProvider;

		if (adaptor !== null) {
			adaptor.propertyKeys.forEach[label|acceptor.accept(createCompletionProposal(label, context));]
		}
	}

	override complete_RelTypeName(EObject model, RuleCall ruleCall, ContentAssistContext context,
		ICompletionProposalAcceptor acceptor) {
		super.complete_RelTypeName(model, ruleCall, context, acceptor);

		val IGraphMetaDataProvider adaptor = CustomOpenCypherActivator.customOpenCypherActivator.
			currentGraphMetaDataProvider;

		if (adaptor !== null) {
			adaptor.relationshipTypes.forEach[label|acceptor.accept(createCompletionProposal(label, context));]
		}
	}
}
