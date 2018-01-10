/*
 * generated by Xtext 2.10.0
 */
package org.slizaa.neo4j.opencypher

import org.slizaa.neo4j.opencypher.conversion.OpenCypherIDValueConverter
import org.slizaa.neo4j.opencypher.scoping.NullGlobalScopeProvider
import org.slizaa.neo4j.opencypher.conversion.OpenCypherValueConverterService

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
class OpenCypherRuntimeModule extends AbstractOpenCypherRuntimeModule {

	override bindIGlobalScopeProvider() {
		NullGlobalScopeProvider
	}

	override bindAbstractIDValueConverter() {
		OpenCypherIDValueConverter
	}

	override bindIValueConverterService() {
		OpenCypherValueConverterService
	}

}
