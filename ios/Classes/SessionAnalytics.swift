import Foundation
import DevRevSDK

class SessionAnalytics {
    
    func startRecording() {
        DevRev.startRecording()
    }
    
    func stopRecording() {
        DevRev.stopRecording()
    }
    
    func pauseRecording() {
        DevRev.pauseRecording()
    }
    
    func resumeRecording() {
        DevRev.resumeRecording()
    }
}
