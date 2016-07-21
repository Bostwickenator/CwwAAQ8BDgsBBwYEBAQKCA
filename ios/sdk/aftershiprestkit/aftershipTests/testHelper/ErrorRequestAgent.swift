//
//  ErrorRequestAgent.swift
//  aftership
//
//  Created by Kwun Ho Chan on 19/07/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation
@testable import AfterShipRestKit

class ErrorRequestAgent: RequestAgent {
	var errorType: RequestErrorType = .ServiceInternalError;
	
	func perform(request request: NSURLRequest, completionHandler: (result: RequestResult<Response>, rateLimit: RateLimit?) -> Void) -> Void {
		let rateLimit = RateLimit(resetDate: NSDate(timeIntervalSinceNow: 60), remaining: 599, limit: 600);
		completionHandler(result: .Error(errorType), rateLimit: rateLimit);
	}
}