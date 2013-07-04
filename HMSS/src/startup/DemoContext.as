/***
 * Copyright 2013 LTN Consulting, Inc. /dba Digital Primates®
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * 
 * @author Michael Labriola <labriola@digitalprimates.net>
 */
package startup {
import eventBus.HMSSBus;

import guice.IGuiceModule;
import guice.binding.IBinder;
import guice.binding.Scope;

public class DemoContext implements IGuiceModule {
		
		public function configure(binder:IBinder):void {
            binder.bind( HMSSBus).inScope( Scope.Singleton).to( HMSSBus );
		}
		
		public function DemoContext() {
			super();
		}
	}
}