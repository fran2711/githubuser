//
//  HTTPStatusCode.swift
//  App
//
//  Created by Álvaro Murillo del Puerto on 27/5/22.
//  Copyright © 2022 Rev Worldwide. All rights reserved.
//

import Foundation

/// https://gist.github.com/ollieatkinson/322338df8a5220d649ac01ff11e7de12
/// This is a list of Hypertext Transfer Protocol (HTTP) response status codes.
/// It includes codes from IETF internet standards, other IETF RFCs, other specifications, and some additional commonly used codes.
/// The first digit of the status code specifies one of five classes of response; an HTTP client must recognise these five classes at a minimum.
public enum HTTPStatusCode: Int, Error {
    
    /// The response class representation of status codes, these get grouped by their first digit.
    public enum ResponseType {
        
        /// - informational: This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
        case informational
        
        /// - success: This class of status codes indicates the action requested by the client was received, understood, accepted, and processed successfully.
        case success
        
        /// - redirection: This class of status code indicates the client must take additional action to complete the request.
        case redirection
        
        /// - clientError: This class of status code is intended for situations in which the client seems to have erred.
        case clientError
        
        /// - serverError: This class of status code indicates the server failed to fulfill an apparently valid request.
        case serverError
        
        /// - undefined: The class of the status code cannot be resolved.
        case undefined
    }
    
    //
    // Informational - 1xx
    //
    
    /// - continue: The server has received the request headers and the client should proceed to send the request body.
    case `continue` = 100
    
    /// - switchingProtocols: The requester has asked the server to switch protocols and the server has agreed to do so.
    case switchingProtocols = 101
    
    /// - processing: This code indicates that the server has received and is processing the request, but no response is available yet.
    case processing = 102
    
    //
    // Success - 2xx
    //
    
    /// - ok: Standard response for successful HTTP requests.
    case ok = 200
    
    /// - created: The request has been fulfilled, resulting in the creation of a new resource.
    case created = 201
    
    /// - accepted: The request has been accepted for processing, but the processing has not been completed.
    case accepted = 202
    
    /// - nonAuthoritativeInformation: The server is a transforming proxy (e.g. a Web accelerator) that received a 200 OK from its origin, but is returning a modified version of the origin's response.
    case nonAuthoritativeInformation = 203
    
    /// - noContent: The server successfully processed the request and is not returning any content.
    case noContent = 204
    
    /// - resetContent: The server successfully processed the request, but is not returning any content.
    case resetContent = 205
    
    /// - partialContent: The server is delivering only part of the resource (byte serving) due to a range header sent by the client.
    case partialContent = 206
    
    /// - multiStatus: The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.
    case multiStatus = 207
    
    /// - alreadyReported: The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.
    case alreadyReported = 208
    
    /// - IMUsed: The server has fulfilled a request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
    case IMUsed = 226
    
    //
    // Redirection - 3xx
    //
    
    /// - multipleChoices: Indicates multiple options for the resource from which the client may choose
    case multipleChoices = 300
    
    /// - movedPermanently: This and all future requests should be directed to the given URI.
    case movedPermanently = 301
    
    /// - found: The resource was found.
    case found = 302
    
    /// - seeOther: The response to the request can be found under another URI using a GET method.
    case seeOther = 303
    
    /// - notModified: Indicates that the resource has not been modified since the version specified by the request headers If-Modified-Since or If-None-Match.
    case notModified = 304
    
    /// - useProxy: The requested resource is available only through a proxy, the address for which is provided in the response.
    case useProxy = 305
    
    /// - switchProxy: No longer used. Originally meant "Subsequent requests should use the specified proxy.
    case switchProxy = 306
    
    /// - temporaryRedirect: The request should be repeated with another URI.
    case temporaryRedirect = 307
    
    /// - permenantRedirect: The request and all future requests should be repeated using another URI.
    case permenantRedirect = 308
    
    //
    // Client Error - 4xx
    //
    
    
    /// - badRequest: The server cannot or will not process the request due to an apparent client error.
    case badRequest = 400
    
    /// - unauthorized: Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
    case unauthorized = 401
    
    /// - paymentRequired: The content available on the server requires payment.
    case paymentRequired = 402
    
    /// - forbidden: The request was a valid request, but the server is refusing to respond to it.
    case forbidden = 403
    
    /// - notFound: The requested resource could not be found but may be available in the future.
    case notFound = 404
    
    /// - methodNotAllowed: A request method is not supported for the requested resource. e.g. a GET request on a form which requires data to be presented via POST
    case methodNotAllowed = 405
    
    /// - notAcceptable: The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.
    case notAcceptable = 406
    
    /// - proxyAuthenticationRequired: The client must first authenticate itself with the proxy.
    case proxyAuthenticationRequired = 407
    
    /// - requestTimeout: The server timed out waiting for the request.
    case requestTimeout = 408
    
    /// - conflict: Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.
    case conflict = 409
    
    /// - gone: Indicates that the resource requested is no longer available and will not be available again.
    case gone = 410
    
    /// - lengthRequired: The request did not specify the length of its content, which is required by the requested resource.
    case lengthRequired = 411
    
    /// - preconditionFailed: The server does not meet one of the preconditions that the requester put on the request.
    case preconditionFailed = 412
    
    /// - payloadTooLarge: The request is larger than the server is willing or able to process.
    case payloadTooLarge = 413
    
    /// - URITooLong: The URI provided was too long for the server to process.
    case URITooLong = 414
    
    /// - unsupportedMediaType: The request entity has a media type which the server or resource does not support.
    case unsupportedMediaType = 415
    
    /// - rangeNotSatisfiable: The client has asked for a portion of the file (byte serving), but the server cannot supply that portion.
    case rangeNotSatisfiable = 416
    
    /// - expectationFailed: The server cannot meet the requirements of the Expect request-header field.
    case expectationFailed = 417
    
    /// - teapot: This HTTP status is used as an Easter egg in some websites.
    case teapot = 418
    
    /// - misdirectedRequest: The request was directed at a server that is not able to produce a response.
    case misdirectedRequest = 421
    
    /// - unprocessableEntity: The request was well-formed but was unable to be followed due to semantic errors.
    case unprocessableEntity = 422
    
    /// - locked: The resource that is being accessed is locked.
    case locked = 423
    
    /// - failedDependency: The request failed due to failure of a previous request (e.g., a PROPPATCH).
    case failedDependency = 424
    
    /// - upgradeRequired: The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.
    case upgradeRequired = 426
    
    /// - preconditionRequired: The origin server requires the request to be conditional.
    case preconditionRequired = 428
    
    /// - tooManyRequests: The user has sent too many requests in a given amount of time.
    case tooManyRequests = 429
    
    /// - requestHeaderFieldsTooLarge: The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.
    case requestHeaderFieldsTooLarge = 431
    
    /// - noResponse: Used to indicate that the server has returned no information to the client and closed the connection.
    case noResponse = 444
    
    /// - unavailableForLegalReasons: A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.
    case unavailableForLegalReasons = 451
    
    /// - SSLCertificateError: An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.
    case SSLCertificateError = 495
    
    /// - SSLCertificateRequired: An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.
    case SSLCertificateRequired = 496
    
    /// - HTTPRequestSentToHTTPSPort: An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.
    case HTTPRequestSentToHTTPSPort = 497
    
    /// - clientClosedRequest: Used when the client has closed the request before the server could send a response.
    case clientClosedRequest = 499
    
    //
    // Server Error - 5xx
    //
    
    /// - internalServerError: A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    case internalServerError = 500
    
    /// - notImplemented: The server either does not recognize the request method, or it lacks the ability to fulfill the request.
    case notImplemented = 501
    
    /// - badGateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.
    case badGateway = 502
    
    /// - serviceUnavailable: The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
    case serviceUnavailable = 503
    
    /// - gatewayTimeout: The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
    case gatewayTimeout = 504
    
    /// - HTTPVersionNotSupported: The server does not support the HTTP protocol version used in the request.
    case HTTPVersionNotSupported = 505
    
    /// - variantAlsoNegotiates: Transparent content negotiation for the request results in a circular reference.
    case variantAlsoNegotiates = 506
    
    /// - insufficientStorage: The server is unable to store the representation needed to complete the request.
    case insufficientStorage = 507
    
    /// - loopDetected: The server detected an infinite loop while processing the request.
    case loopDetected = 508
    
    /// - notExtended: Further extensions to the request are required for the server to fulfill it.
    case notExtended = 510
    
    /// - networkAuthenticationRequired: The client needs to authenticate to gain network access.
    case networkAuthenticationRequired = 511
    
    /// The class (or group) which the status code belongs to.
    public var responseType: ResponseType {
        
        switch self.rawValue {
            
        case 100..<200:
            return .informational
            
        case 200..<300:
            return .success
            
        case 300..<400:
            return .redirection
            
        case 400..<500:
            return .clientError
            
        case 500..<600:
            return .serverError
            
        default:
            return .undefined
            
        }
    }
}

public extension HTTPURLResponse {
     var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }
}


extension HTTPResponseStatus {
    /// The numerical status code for a given HTTP response status.
    public var code: UInt {
        get {
            switch self {
            case .continue:
                return 100
            case .switchingProtocols:
                return 101
            case .processing:
                return 102
            case .ok:
                return 200
            case .created:
                return 201
            case .accepted:
                return 202
            case .nonAuthoritativeInformation:
                return 203
            case .noContent:
                return 204
            case .resetContent:
                return 205
            case .partialContent:
                return 206
            case .multiStatus:
                return 207
            case .alreadyReported:
                return 208
            case .imUsed:
                return 226
            case .multipleChoices:
                return 300
            case .movedPermanently:
                return 301
            case .found:
                return 302
            case .seeOther:
                return 303
            case .notModified:
                return 304
            case .useProxy:
                return 305
            case .temporaryRedirect:
                return 307
            case .permanentRedirect:
                return 308
            case .badRequest:
                return 400
            case .unauthorized:
                return 401
            case .paymentRequired:
                return 402
            case .forbidden:
                return 403
            case .notFound:
                return 404
            case .methodNotAllowed:
                return 405
            case .notAcceptable:
                return 406
            case .proxyAuthenticationRequired:
                return 407
            case .requestTimeout:
                return 408
            case .conflict:
                return 409
            case .gone:
                return 410
            case .lengthRequired:
                return 411
            case .preconditionFailed:
                return 412
            case .payloadTooLarge:
                return 413
            case .uriTooLong:
                return 414
            case .unsupportedMediaType:
                return 415
            case .rangeNotSatisfiable:
                return 416
            case .expectationFailed:
                return 417
            case .imATeapot:
                return 418
            case .misdirectedRequest:
                return 421
            case .unprocessableEntity:
                return 422
            case .locked:
                return 423
            case .failedDependency:
                return 424
            case .upgradeRequired:
                return 426
            case .preconditionRequired:
                return 428
            case .tooManyRequests:
                return 429
            case .requestHeaderFieldsTooLarge:
                return 431
            case .unavailableForLegalReasons:
                return 451
            case .internalServerError:
                return 500
            case .notImplemented:
                return 501
            case .badGateway:
                return 502
            case .serviceUnavailable:
                return 503
            case .gatewayTimeout:
                return 504
            case .httpVersionNotSupported:
                return 505
            case .variantAlsoNegotiates:
                return 506
            case .insufficientStorage:
                return 507
            case .loopDetected:
                return 508
            case .notExtended:
                return 510
            case .networkAuthenticationRequired:
                return 511
            case .custom(code: let code, reasonPhrase: _):
                return code
            }
        }
    }

    /// The string reason phrase for a given HTTP response status.
    public var reasonPhrase: String {
        get {
            switch self {
            case .continue:
                return "Continue"
            case .switchingProtocols:
                return "Switching Protocols"
            case .processing:
                return "Processing"
            case .ok:
                return "OK"
            case .created:
                return "Created"
            case .accepted:
                return "Accepted"
            case .nonAuthoritativeInformation:
                return "Non-Authoritative Information"
            case .noContent:
                return "No Content"
            case .resetContent:
                return "Reset Content"
            case .partialContent:
                return "Partial Content"
            case .multiStatus:
                return "Multi-Status"
            case .alreadyReported:
                return "Already Reported"
            case .imUsed:
                return "IM Used"
            case .multipleChoices:
                return "Multiple Choices"
            case .movedPermanently:
                return "Moved Permanently"
            case .found:
                return "Found"
            case .seeOther:
                return "See Other"
            case .notModified:
                return "Not Modified"
            case .useProxy:
                return "Use Proxy"
            case .temporaryRedirect:
                return "Temporary Redirect"
            case .permanentRedirect:
                return "Permanent Redirect"
            case .badRequest:
                return "Bad Request"
            case .unauthorized:
                return "Unauthorized"
            case .paymentRequired:
                return "Payment Required"
            case .forbidden:
                return "Forbidden"
            case .notFound:
                return "Not Found"
            case .methodNotAllowed:
                return "Method Not Allowed"
            case .notAcceptable:
                return "Not Acceptable"
            case .proxyAuthenticationRequired:
                return "Proxy Authentication Required"
            case .requestTimeout:
                return "Request Timeout"
            case .conflict:
                return "Conflict"
            case .gone:
                return "Gone"
            case .lengthRequired:
                return "Length Required"
            case .preconditionFailed:
                return "Precondition Failed"
            case .payloadTooLarge:
                return "Payload Too Large"
            case .uriTooLong:
                return "URI Too Long"
            case .unsupportedMediaType:
                return "Unsupported Media Type"
            case .rangeNotSatisfiable:
                return "Range Not Satisfiable"
            case .expectationFailed:
                return "Expectation Failed"
            case .imATeapot:
                return "I'm a teapot"
            case .misdirectedRequest:
                return "Misdirected Request"
            case .unprocessableEntity:
                return "Unprocessable Entity"
            case .locked:
                return "Locked"
            case .failedDependency:
                return "Failed Dependency"
            case .upgradeRequired:
                return "Upgrade Required"
            case .preconditionRequired:
                return "Precondition Required"
            case .tooManyRequests:
                return "Too Many Requests"
            case .requestHeaderFieldsTooLarge:
                return "Request Header Fields Too Large"
            case .unavailableForLegalReasons:
                return "Unavailable For Legal Reasons"
            case .internalServerError:
                return "Internal Server Error"
            case .notImplemented:
                return "Not Implemented"
            case .badGateway:
                return "Bad Gateway"
            case .serviceUnavailable:
                return "Service Unavailable"
            case .gatewayTimeout:
                return "Gateway Timeout"
            case .httpVersionNotSupported:
                return "HTTP Version Not Supported"
            case .variantAlsoNegotiates:
                return "Variant Also Negotiates"
            case .insufficientStorage:
                return "Insufficient Storage"
            case .loopDetected:
                return "Loop Detected"
            case .notExtended:
                return "Not Extended"
            case .networkAuthenticationRequired:
                return "Network Authentication Required"
            case .custom(code: _, reasonPhrase: let phrase):
                return phrase
            }
        }
    }
}

/// A HTTP response status code.
public enum HTTPResponseStatus: Sendable {
    /* use custom if you want to use a non-standard response code or
     have it available in a (UInt, String) pair from a higher-level web framework. */
    case custom(code: UInt, reasonPhrase: String)

    /* all the codes from http://www.iana.org/assignments/http-status-codes */

    // 1xx
    case `continue`
    case switchingProtocols
    case processing
    // TODO: add '103: Early Hints' (requires bumping SemVer major).

    // 2xx
    case ok
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case imUsed

    // 3xx
    case multipleChoices
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case temporaryRedirect
    case permanentRedirect

    // 4xx
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case imATeapot
    case misdirectedRequest
    case unprocessableEntity
    case locked
    case failedDependency
    case upgradeRequired
    case preconditionRequired
    case tooManyRequests
    case requestHeaderFieldsTooLarge
    case unavailableForLegalReasons

    // 5xx
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended
    case networkAuthenticationRequired

    /// Whether responses with this status code may have a response body.
    public var mayHaveResponseBody: Bool {
        switch self {
        case .`continue`,
             .switchingProtocols,
             .processing,
             .noContent,
             .custom where (code < 200) && (code >= 100):
            return false
        default:
            return true
        }
    }

    /// Initialize a `HTTPResponseStatus` from a given status and reason.
    ///
    /// - Parameter statusCode: The integer value of the HTTP response status code
    /// - Parameter reasonPhrase: The textual reason phrase from the response. This will be
    ///     discarded in favor of the default if the `statusCode` matches one that we know.
    public init(statusCode: Int, reasonPhrase: String = "") {
        switch statusCode {
        case 100:
            self = .`continue`
        case 101:
            self = .switchingProtocols
        case 102:
            self = .processing
        case 200:
            self = .ok
        case 201:
            self = .created
        case 202:
            self = .accepted
        case 203:
            self = .nonAuthoritativeInformation
        case 204:
            self = .noContent
        case 205:
            self = .resetContent
        case 206:
            self = .partialContent
        case 207:
            self = .multiStatus
        case 208:
            self = .alreadyReported
        case 226:
            self = .imUsed
        case 300:
            self = .multipleChoices
        case 301:
            self = .movedPermanently
        case 302:
            self = .found
        case 303:
            self = .seeOther
        case 304:
            self = .notModified
        case 305:
            self = .useProxy
        case 307:
            self = .temporaryRedirect
        case 308:
            self = .permanentRedirect
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 402:
            self = .paymentRequired
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 405:
            self = .methodNotAllowed
        case 406:
            self = .notAcceptable
        case 407:
            self = .proxyAuthenticationRequired
        case 408:
            self = .requestTimeout
        case 409:
            self = .conflict
        case 410:
            self = .gone
        case 411:
            self = .lengthRequired
        case 412:
            self = .preconditionFailed
        case 413:
            self = .payloadTooLarge
        case 414:
            self = .uriTooLong
        case 415:
            self = .unsupportedMediaType
        case 416:
            self = .rangeNotSatisfiable
        case 417:
            self = .expectationFailed
        case 418:
            self = .imATeapot
        case 421:
            self = .misdirectedRequest
        case 422:
            self = .unprocessableEntity
        case 423:
            self = .locked
        case 424:
            self = .failedDependency
        case 426:
            self = .upgradeRequired
        case 428:
            self = .preconditionRequired
        case 429:
            self = .tooManyRequests
        case 431:
            self = .requestHeaderFieldsTooLarge
        case 451:
            self = .unavailableForLegalReasons
        case 500:
            self = .internalServerError
        case 501:
            self = .notImplemented
        case 502:
            self = .badGateway
        case 503:
            self = .serviceUnavailable
        case 504:
            self = .gatewayTimeout
        case 505:
            self = .httpVersionNotSupported
        case 506:
            self = .variantAlsoNegotiates
        case 507:
            self = .insufficientStorage
        case 508:
            self = .loopDetected
        case 510:
            self = .notExtended
        case 511:
            self = .networkAuthenticationRequired
        default:
            self = .custom(code: UInt(statusCode), reasonPhrase: reasonPhrase)
        }
    }
}

extension HTTPResponseStatus: CustomStringConvertible {
    public var description: String {
        return "\(self.code) \(self.reasonPhrase)"
    }
}
