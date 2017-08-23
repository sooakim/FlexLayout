// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Created by Luc Dion on 2017-07-17.

import UIKit
import FlexLayout
import PinLayout

class YogaExampleEView: BaseView {
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        // Yoga's Android example
        rootFlexContainer.flex.define { (flex) in
            flex.addItem(imageView).grow(1)
            
            flex.addContainer().direction(.row).padding(20).alignItems(.center).define({ (flex) in
                flex.addContainer().size(50).define({ (flex) in
                    flex.view.backgroundColor = .flexLayoutColor
                })

                flex.addContainer().height(25).marginStart(20).grow(1).define({ (flex) in
                    flex.view.backgroundColor = .black
                })
            })
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout 
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top(topLayoutGuide).left().width(100%).height(300)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}